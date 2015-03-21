ActiveAdmin.register Investment do
  config.sort_order = 'id_asc'

  index do
    column :name do |investment|
      link_to investment.name, admin_investment_path(investment)
    end

    column "Logo" do |investment|
      image_tag investment.logo_link, :class => 'logo_link_img'
    end

    column :investment_type
    column :raise_amount
    column :spots_available
    column :status


    actions
  end



  form do |f|
    f.inputs do
      f.input :name
      f.input :logo_link
      f.input :investment_type
      f.input :raise_amount
      f.input :minimum_raise_amount
      f.input :investment_duration
      f.input :video_link
      f.input :status
      f.input :risk_rating
      f.input :investment_minimum
      f.input :key_information, :as => :html_editor
      # f.input :photo_link_id
      #f.input :principle_bio_id

      f.input :note, :as => :html_editor
      f.input :qa, :as => :html_editor

      f.submit
    end

  end



end
