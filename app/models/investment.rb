class Investment < ActiveRecord::Base

  def get_landing_page_investments(status)
    # TODO Don't set hard values, change that stuff
    limit = status == 'past' ? '8': '3'
    sql = "SELECT * FROM investments WHERE status='"+status+"' LIMIT "+limit+" "
    @list = ActiveRecord::Base.connection.execute(sql)
  end


end
