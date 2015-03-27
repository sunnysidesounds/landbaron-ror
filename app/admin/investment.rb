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
    column :status


    actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :logo do
        image_tag(ad.logo.url(:thumb))
      end
      # Will display the image on show object page
    end
  end


  # Detail view / form
  form :html => { :enctype => 'multipart/form-data' } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :logo, :as => :file, :required => false, :hint => image_tag(f.object.logo.url), :label => 'Logo Image'
      f.input :investment_type
      f.input :raise_amount
      f.input :minimum_raise_amount
      f.input :investment_duration
      f.input :video_link
      f.input :status
      f.input :risk_rating
      f.input :investment_minimum
      f.input :key_information, :as => :html_editor
      f.input :note, :as => :html_editor
      f.input :qa, :as => :html_editor

      f.submit
    end

  end



end
