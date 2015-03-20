class PrincipleInvestor < ActiveRecord::Base

  def get_principle_investor_bios(inventment_id)
    sql = "SELECT * FROM principle_investors WHERE investment_id='"+inventment_id+"' ORDER BY id"
    @list = ActiveRecord::Base.connection.execute(sql)
  end


end
