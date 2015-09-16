ActiveAdmin.register User do

  config.sort_order = 'id_asc'
  permit_params :username, :email, :first_name, :last_name, :phone_number,
      :address, :city, :state, :country, :postal_code, :password, :legal_name, :date_of_birth, :tax_id_number

  # List view
  index do
    column :username
    column :name do |user|
      link_to user.email, admin_user_path(user)
    end

    column :first_name
    column :last_name
    column :phone_number
    column :created_at


    actions
  end

  # Will display the image on show object page
  show do |user|
    panel "User Key Details" do
      attributes_table_for user do
        row :username
        row :email
        row :first_name
        row :last_name
        row :legal_name
        row :phone_number
        row :address
        row :city
        row :state
        row :postal_code
        row :created_at
        row :country
        row :accredition_status do 
          status_tag (user.accredition_status), ((user.accredition_accepted? ? :ok : (user.accredition_pending? ? :warn : :error)))
        end
        row :date_of_birth
        row :tax_id_number         
        row :marketo_lead_id            
        row :fund_america_id
        row :investor_accreditation_form_url
      end
    end
    panel "Marketing related Data" do
      attributes_table_for user do 
        row :property_types             
        row :deal_types                 
        row :budget_range               
        row :risk_tolerance             
        row :property_categories        
        row :invested_in_realestate     
        row :hear_about_us              
        row :reason_to_invest           
        row :current_investments        
        row :annual_income_without_taxes
        row :describes_you
      end
    end
  end


  # Detail view / form
  form :html => { :enctype => 'multipart/form-data' } do |f|
    f.inputs "User Details" do
      f.input :username, :required => true
      f.input :email, :required => true, hint: "This is required field for FA(Fund America), Make sure this is initialized in order to create user on FA"
      # f.input :password
      #f.input :password_confirmation
      f.input :first_name, :required => true
      f.input :last_name, :required => true
      f.input :legal_name, hint: "This is required field for FA(Fund America), Make sure this is initialized in order to create user on FA"
      f.input :phone_number, :required => true, hint: "This is required field for FA(Fund America), Make sure this is initialized in order to create user on FA"
      f.input :address, :required => true, hint: "This is required field for FA(Fund America), Make sure this is initialized in order to create user on FA"
      f.input :city, :required => true, hint: "This is required field for FA(Fund America), Make sure this is initialized in order to create user on FA"
      f.input :state, :required => true, hint: "This is required field for FA(Fund America), Make sure this is initialized in order to create user on FA"
      f.input :country, :required => true, hint: "This is required field for FA(Fund America), Make sure this is initialized in order to create user on FA"
      f.input :postal_code, :required => true, hint: "This is required field for FA(Fund America), Make sure this is initialized in order to create user on FA"
      f.input :date_of_birth, as: :datepicker, hint: "This is required field for FA(Fund America), Make sure this is initialized in order to create user on FA"
      f.input :tax_id_number, hint: "This is required field for FA(Fund America), Make sure this is initialized in order to create user on FA"
      f.submit 'Submit', :class => 'active_admin_button'
      f.cancel_link('/admin/users')
    end
  end

  action_item :submit_to_fund_america, only: :show do
    if !user.registered_to_fund_america?
      link_to "Submit to FA", register_user_to_fund_america_admin_user_path(user) 
    elsif user.registered_to_fund_america? and user.investor_accreditation.nil?
      link_to "Request URL for accreditation", request_url_for_accreditation_admin_user_path(user), target: '_blank'
    elsif user.registered_to_fund_america? and !(user.investor_accreditation.nil?)
      link_to "Mark user status as Confirmed", mark_user_as_confirmed_on_fa_admin_user_path(user)
    end
  end

  member_action :mark_user_as_confirmed_on_fa, method: :get do
    status, message = resource.change_status_of_accreditation_if_test_mode('confirmed')
    if status
      flash[:notice] = message
      redirect_to :back
    else
      flash[:error] = message
      redirect_to :back
    end
  end


  member_action :register_user_to_fund_america, method: :get do
    status, message = resource.create_user_on_fa!
    if status
      flash[:notice] = message
      redirect_to :back
    else
      flash[:error] = "Following error occured while saving: #{message['entity']}"
      redirect_to :back
    end
  end

  member_action :request_url_for_accreditation, method: :get do
    status, message = resource.generate_investor_accreditation_link
    if status
      redirect_to resource.investor_accreditation_form_url and return if resource.investor_accreditation_form_url
      flash[:error] = message['entity']
      redirect_to :back
      # flash[:notice] = "Investor accreditation questionare form link is generated and attached to this user."
    else
      flash[:error] = message
      redirect_to :back
    end
  end

end
