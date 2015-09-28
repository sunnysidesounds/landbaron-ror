# == Schema Information
#
# Table name: investor_accreditations
#
#  id                    :integer          not null, primary key
#  fund_america_form_url :string
#  status                :string
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class InvestorAccreditation < ActiveRecord::Base
  CONFIRMED = 'confirmed'
  PENDING = 'pending'
  DENIED = 'denied'
  EXPIRED = 'expired'

  belongs_to :user

  before_create :mark_as_pending_if_no_state

  def mark_as_pending_if_no_state
    self.status = PENDING if self.status.blank?
  end

  def to_s
    id
  end

  def fetch_form_and_update_fields(url, field_to_update)
    begin
      resp = FundAmerica::API::request(:get, url)
      self.send("#{field_to_update}=", resp["#{field_to_update}"])
      self.save
    rescue FundAmerica::Error => e
      # Exception handling
      # e.parsed_response gives a response hash of the error response sent by FundAmerica
      puts "::::::::::::::::::::::::::::::::::::::Error IN FA::::::::::::::::::::::::::::::::::::"
      puts e.parsed_response
      puts "/n"
      puts e.message
      return false, e.parsed_response
    end
  end
end
