class Medium < ActiveRecord::Base

  has_attached_file :media_item

  def get_investment_media(id)
    sql = "SELECT * FROM media WHERE investment_id='"+id+"'"
    @list = ActiveRecord::Base.connection.execute(sql)
  end

 # def get_a_investment_media(id)
 #   @inv = Medium.find(id)
 # end



end
