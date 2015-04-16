ActiveAdmin.register User do

  config.sort_order = 'id_asc'
  permit_params :username, :email, :first_name, :last_name, :phone_number,
      :address, :city, :state, :postal_code, :password

  # List view
  index do
    column :username
    column :name do |user|
      link_to user.email, admin_user_path(user)
    end

    column :first_name
    column :last_name
    column :phone_number


    actions
  end

  # Will display the image on show object page
  show do |ad|
    attributes_table do
      row :username
      row :email
      row :first_name
      row :last_name
      row :phone_number
      row :address
      row :city
      row :state
      row :postal_code

    end
  end


  # Detail view / form
  form :html => { :enctype => 'multipart/form-data' } do |f|
    f.inputs "User Details" do
      f.input :username, :required => true
      f.input :email, :required => true

      #f.input :password
      #f.input :password_confirmation


      f.input :first_name, :required => true
      f.input :last_name, :required => true
      f.input :phone_number, :required => true
      f.input :address, :required => true
      f.input :city, :required => true
      f.input :state, :required => true
      f.input :postal_code, :required => true

      f.submit 'Submit', :class => 'active_admin_button'
      f.cancel_link('/admin/users')
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
