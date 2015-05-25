ActiveAdmin.register Vote do

  permit_params :investment_id, :user_id, :value
  config.clear_action_items!

  # List view
  index do
    investment = Investment.new
    user_info = User.new

    column :"Investment" do |vote|
      i = investment.get_a_investment_detail(vote.investment_id)
      link_to i.name, admin_investment_path(vote.investment_id)
    end

    column :name do |vote|
      u = user_info.get_user(vote.user_id)
      link_to u.first_name + " " + u.last_name, admin_quote_path(vote)
    end

    column :value
    column:created_at

    actions
  end


  # Will display the image on show object page
  show do |ad|
    user_info = User.new
    investment = Investment.new
    u = user_info.get_user(vote.user_id)
    inv = investment.get_a_investment_detail(vote.investment_id)


    attributes_table do
      row :id
      row :user_id do
        link_to u.first_name + " " + u.last_name, admin_quote_path(vote)
      end
      row 'Investment' do
        link_to inv.name, admin_investment_path(vote.investment_id)
      end

      row :value
      row :created_at

    end
  end


  form :html => { :enctype => 'multipart/form-data' } do |f|
    investment = Investment.new
    i = investment.get_all
    user_info = User.new
    u = user_info.get_user(vote.user_id)

    f.inputs "Voting Details" do
      f.input :user_id, :input_html => { :disabled => true } ,  :label => u.first_name + " " + u.last_name + ' ID'
      f.input :investment_id, :as => :select,
              :collection => i,
              :required => true,
              :include_blank => false

      f.input :value, :as => :select,
              :collection => [['True', '1'],
                              ['False','0']],
              :required => true,
              :include_blank => false

      f.submit 'Submit', :class => 'active_admin_button'
      f.cancel_link('/admin/votes')
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
