ActiveAdmin.register Medium , :as => 'Media' do
  permit_params :investment_id, :media_item
  config.filters = false


  # List view
  index do
    investment = Investment.new
    column :investment_id do |medium|
      link_to investment.get_a_investment_detail(medium.investment_id).name, admin_medium_path(medium)
    end

    column "File" do |medium|
      image_tag medium.media_item, :class => 'media_item_link_img'
    end

    column:media_item_file_name

    actions
  end


  #Save view, not being used, due to redirect in controllers
  show do |ad|
    investment = Investment.new
    attributes_table do
      row :investment_id
      row :media_item_file_name
      row :media_item do
        image_tag(ad.media_item.url(), :class =>"media_image_show")
      end
    end
  end

  #Edit update view
  form :html => { :enctype => 'multipart/form-data' } do |f|
    investment = Investment.new
    i = investment.get_all

    f.inputs "Media Details" do
      f.input :investment_id, :as => :select,
              :collection => i,
              :required => true,
              :include_blank => false

      f.input :media_item, :as => :file,
              :required => false,
              :hint => image_tag(f.object.media_item.url),
              :label => 'File',
              :class => 'media_image'


      f.submit 'Submit', :class => 'active_admin_button'
      f.cancel_link('/admin/media')

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
