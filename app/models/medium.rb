class Medium < ActiveRecord::Base

  def get_investment_media(id)
    sql = "SELECT * FROM media WHERE investment_id='"+id+"'"
    @list = ActiveRecord::Base.connection.execute(sql)
  end





end
