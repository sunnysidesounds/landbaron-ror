class Investment < ActiveRecord::Base

  def get_landing_page_investments(status)
    limit = status == 'past' ? '8': '3'
    sql = "SELECT * FROM investments WHERE status='"+status+"' ORDER BY id LIMIT "+limit+" "
    @list = ActiveRecord::Base.connection.execute(sql)
  end

  def get_investment_details(id)
    sql = "SELECT * FROM investments WHERE id='"+id+"' ORDER BY id"
    @list = ActiveRecord::Base.connection.execute(sql)
  end


end