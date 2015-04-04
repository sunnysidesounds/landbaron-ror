ActiveAdmin.register Investment do


  config.sort_order = 'id_asc'
  permit_params :name, :logo_link, :investment_type, :raise_amount,
  :minimum_raise_amount, :investment_duration, :video_link, :status,
  :risk_rating, :investment_minimum, :key_information, :note, :qa, :logo

  # List view
  index do
    column :name do |investment|
      link_to investment.name, admin_investment_path(investment)
    end

    column "Logo" do |investment|
      image_tag investment.logo, :class => 'logo_link_img'
    end

    column :investment_type
    column :raise_amount
    column :spots_available
    column :spots_have
    column :status


    actions
  end

  # Will display the image on show object page
  show do |ad|
    attributes_table do
      row :name
      row :status
      row :logo do
        image_tag(ad.logo.url(:thumb))
      end
      row :investment_type
      row :raise_amount
      row :minimum_raise_amount
      row :investment_duration
      row :risk_rating
      row :investment_minimum
      row :key_information
      row :note
      row :qa

    end
  end


  # Detail view / form
  form :html => { :enctype => 'multipart/form-data' } do |f|
    f.inputs "Details" do
      f.input :name, :required => true
      f.input :spots_have, :label => 'Spots Have'
      f.input :spots_available, :label => 'Spots Available'
      f.input :status, :as => :select,
              :collection => [['Available', 'available'],
                              ['Coming Soon','coming_soon'],
                              ['Past', 'past']],
              :required => true,
              :include_blank => false
      f.input :logo, :as => :file,
              :required => false,
              :hint => image_tag(f.object.logo.url),
              :label => 'Logo'
      f.input :investment_type, :label => 'Investment Type'
      f.input :raise_amount, :required => true
      f.input :minimum_raise_amount, :label => 'Minimum Raise Amount'
      f.input :investment_duration, :label => 'Investment Duration'
      f.input :risk_rating, :label => 'Risk Rating'
      f.input :investment_minimum, :label => 'Investment Minimum'
      f.input :key_information, :as => :html_editor, :label => 'Key Information'
      f.input :note, :as => :html_editor
      f.input :qa, :as => :html_editor, :label => 'Question & Answer'
      f.submit 'Submit', :class => 'active_admin_button'
      f.cancel_link('/admin/investments')
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
