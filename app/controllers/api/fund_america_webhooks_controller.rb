class Api::FundAmericaWebhooksController < ::ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :verify_request


  def process_hook
    @fa_webhook = FundAmericaWebhook.find_or_create_by(@webhook)
    if @fa_webhook.persisted?
      if(@fa_webhook.object_type == "investor_accreditation")
        entity_id = @fa_webhook.url.gsub("#{FundAmerica.base_uri}entities/", "").gsub("/investor_accreditation", "")
        user = User.find_by(fund_america_id: entity_id)
        if user
          user.investor_accreditation.fetch_form_and_update_fields(@fa_webhook.url, @fa_webhook.changes_fields.split(", ").first)
          @fa_webhook.update_attributes(processed: true, entity_id: entity_id)
        end
      end
      render :nothing => true, :status => 200, :content_type => 'text/html'
    else
      render :nothing => true, :status => 422, :content_type => 'text/html'
    end
  end


  def verify_request
    @webhook = JSON.parse(params[:data])
    @webhook['action_id'] = @webhook.delete('id')
    @webhook['object_type'] = @webhook.delete('object')    
    @webhook['changes_fields'] = @webhook['changes'].join(", ")
    @webhook.delete('changes')
    puts "*" * 100
    puts @webhook
    webhook_id = @webhook['webhook_id']
    expected_signature = Digest::MD5.hexdigest(webhook_id + ENV['FA_WEB_HOOK_VERIFY_TOKEN'])
    if expected_signature == @webhook['signature']
      return true
    end
    return false
  end
end
