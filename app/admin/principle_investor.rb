ActiveAdmin.register PrincipleInvestor do
  permit_params :investment_id, :user_id, :img_url, :bio, :occupation, :full_name, :profile_pic


  index do
    investment = Investment.new

    column "Profile Pic" do |principle_investor|
      image_tag principle_investor.profile_pic, :class => 'principle_investor_link_img'
    end

    column :fullname do |principle_investor|
      link_to principle_investor.full_name, admin_principle_investor_path(principle_investor)
    end
    column :investment_id do |principle_investor|
      link_to investment.get_a_investment_detail(principle_investor.investment_id).name, admin_principle_investor_path(principle_investor)
    end
    column :occupation

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
