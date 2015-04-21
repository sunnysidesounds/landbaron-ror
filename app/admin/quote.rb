ActiveAdmin.register Quote do


  config.sort_order = 'id_asc'
  permit_params :reference_id, :investment_id, :user_id,
                :investor_profile_type, :status, :payment_methd


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
    column :status
    actions
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
