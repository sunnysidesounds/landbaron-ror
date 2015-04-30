ActiveAdmin.register Quote do


  config.sort_order = 'id_asc'
  permit_params :reference_id, :investment_id, :user_id,
                :investor_profile_type, :status, :payment_methd, :total_amount


  # List view
  index do

   # u = user_info.get_user(quote.user_id)
    user_info = User.new
    investment = Investment.new
    column :name do |quote|
      u = user_info.get_user(quote.user_id)
      link_to u.first_name + " " + u.last_name, admin_quote_path(quote)
    end
    column :reference_id
    column :"Investment" do |quote|
      i = investment.get_a_investment_detail(quote.investment_id)
      link_to i.name, admin_investment_path(quote.investment_id)
    end
    column :investor_profile_type
    column :total_amount
    column :status
    actions
  end


  # Will display the image on show object page
  show do |ad|
    user_info = User.new
    investment = Investment.new
    u = user_info.get_user(quote.user_id)
    inv = investment.get_a_investment_detail(quote.investment_id)


    attributes_table do
      row :id
      row :reference_id
      row :user_id do
        link_to u.first_name + " " + u.last_name, admin_quote_path(quote)
      end
      row 'Investment' do
        link_to inv.name, admin_investment_path(quote.investment_id)
      end

      row :total_amount
      row :investor_profile_type

      row 'Payment Method' do
        :payment_methd
      end



      row :status

    end
  end



  # Detail view / form
  form :html => { :enctype => 'multipart/form-data' } do |f|
    f.inputs "Quote Details" do

      user_info = User.new
      investment = Investment.new
      u = user_info.get_user(quote.user_id)
      inv = investment.get_a_investment_detail(quote.investment_id)


      f.input :user_id, :input_html => { :disabled => true } ,  :label => u.first_name + " " + u.last_name + ' ID'
      f.input :investment_id, :input_html => { :disabled => true } ,  :label => inv.name + " ID"
      f.input :total_amount, :required => true, :label => 'Investment Amount'
      f.input :investor_profile_type, :as => :select,
              :collection => [['Entity', 'entity'],
                              ['Myself','myself'],
                              ['IRA', 'ira']],
              :required => true,
              :include_blank => false
      f.input :payment_methd, :as => :select,
              :collection => [['Transfer', 'transfer'],
                              ['Check','check']],
              :required => true,
              :include_blank => false
      f.input :status, :as => :select,
              :collection => [['Pending', 'pending'],
                              ['Completed','completed']],
              :required => true,
              :include_blank => false
      f.submit 'Submit', :class => 'active_admin_button'
      f.cancel_link('/admin/quote')
    end
  end


  # Redirect to list view
  controller do

    def update
      update! do |format|
        format.html { redirect_to collection_path } if resource.valid?
      end
    end

    def create
      create! do |format|
        format.html { redirect_to collection_path } if resource.valid?
      end
    end

  end

end
