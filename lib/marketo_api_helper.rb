module MarketoApiHelper

  # This return Marketo client Object
  def get_mrkt_client
    client = Mrkt::Client.new(
      :host => Settings.mrkt_host,
      :client_id =>  Settings.mrkt_client_id,
      :client_secret => Settings.mrk_client_secret)
    client.debug = true
    return client
  end

  # This gets our users information from Marketo
  # string : email_address
  def get_mrkt_lead(email_address)
    response = get_mrkt_client.get_leads(:email, email_address)
    response[:result].each do |result|
      p "id: #{result[:id]}, email: #{result[:email]}"
    end
  end

  # This sends our user information to Marketo
  # string : email_address
  # string : first_name
  # string : last_name
  # string : company
  # string : phone
  def set_mrkt_lead(email_address, first_name, last_name, company, phone)
    response = get_mrkt_client.createupdate_leads(
        [{ :email => email_address,
           :firstName => first_name,
           :lastname => last_name,
           :company => company,
           :phone => phone}],
        :lookup_field => :email)
    response[:result].each do |result|
      p "id: #{result[:id]}, email: #{result[:email]}"
      logger.info p
    end
  end

end