class PrincipleInvestor < ActiveRecord::Base

  has_attached_file :profile_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/dummy-investor.png"


  def get_principle_investor_bios(inventment_id)
    sql = "SELECT * FROM principle_investors WHERE investment_id='"+inventment_id+"' ORDER BY id"
    @list = ActiveRecord::Base.connection.execute(sql)
  end


end
