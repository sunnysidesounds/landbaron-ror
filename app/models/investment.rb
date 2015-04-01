class Investment < ActiveRecord::Base

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/logo-placeholder.gif"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  # Deprecated method, use get_lp_investments instead
  def get_landing_page_investments(status)
    limit = status == 'past' ? '8': '3'
    sql = "SELECT * FROM investments WHERE status='"+status+"' ORDER BY id LIMIT "+limit+" "
    @list = ActiveRecord::Base.connection.execute(sql)
  end

  def get_lp_investments(stat_key)
    limit = stat_key == 'past' ? '8': '3'
    @inv = Investment.where(:status => stat_key).first(limit)
  end

  def get_investment_details(id)
    sql = "SELECT * FROM investments WHERE id='"+id+"' ORDER BY id"
    @list = ActiveRecord::Base.connection.execute(sql)
  end

  def logo_url
    logo.url(:medium)
  end


end
