class AddDeviseAttributesToUser < ActiveRecord::Migration
  def change
      add_column :users, :encrypted_password, :string, {null: false, default: ""}
      add_column :users, :password_migrated, :boolean, default: true

      ## Recoverable
      add_column :users, :reset_password_token, :string
      add_column :users, :reset_password_sent_at, :datetime

      ## Rememberable
      add_column :users, :remember_created_at, :datetime

      ## Trackable
      add_column :users, :sign_in_count, :integer, {default: 0, null: false}
      add_column :users, :current_sign_in_at, :datetime
      add_column :users, :last_sign_in_at, :datetime
      add_column :users, :current_sign_in_ip, :inet
      add_column :users, :last_sign_in_ip, :inet

      User.update_all(password_migrated: false)

  end
end
