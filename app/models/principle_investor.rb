# == Schema Information
#
# Table name: principle_investors
#
#  id                       :integer          not null, primary key
#  investment_id            :integer
#  user_id                  :integer
#  full_name                :string
#  img_url                  :string
#  bio                      :text
#  occupation               :string
#  created_at               :datetime
#  updated_at               :datetime
#  profile_pic_file_name    :string
#  profile_pic_content_type :string
#  profile_pic_file_size    :integer
#  profile_pic_updated_at   :datetime
#

class PrincipleInvestor < ActiveRecord::Base

  belongs_to :investment

  has_attached_file :profile_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/dummy-investor.png"
  do_not_validate_attachment_file_type :profile_pic


  # Depecated method use get_principal_investors method
  # def get_principle_investor_bios(inventment_id)
  #   sql = "SELECT * FROM principle_investors WHERE investment_id='"+inventment_id+"' ORDER BY id"
  #   @list = ActiveRecord::Base.connection.execute(sql)
  # end

  def get_principal_investors(id)
    @inv = PrincipleInvestor.where(:investment_id => id)
  end


end
