class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password_hash
      t.string :password_salt
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :income_range
      t.boolean :principle_investor
      t.boolean :verified
      t.timestamps
    end
  end

  def down
    drop_table :users
  end

end
