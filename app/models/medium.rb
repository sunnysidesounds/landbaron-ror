class Medium < ActiveRecord::Base

  has_attached_file :media_item
  do_not_validate_attachment_file_type :media_item


  # This method is deprecated, use get_all_investment_media
  def get_investment_media(id)
    sql = "SELECT * FROM media WHERE investment_id='"+id+"'"
    @list = ActiveRecord::Base.connection.execute(sql)
  end

  def get_all_investment_media(id)
    @inv = Medium.where(:investment_id => id)
  end

  def get_all_investment_media_group()
    @inv = Medium.select("*").group("investment_id")
  end

  def get_all()
   @inv =  Medium.select('investment_id, id')
  end


end
