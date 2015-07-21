class AddFieldsToSignUpForm < ActiveRecord::Migration
  def change
    add_column :users, :country, :string, :after => :city
    add_column :users, :property_types, :string
    add_column :users, :deal_types, :string
    add_column :users, :budget_range, :string
    add_column :users, :risk_tolerance, :string
    add_column :users, :property_categories, :string
    add_column :users, :invested_in_realestate, :string
    add_column :users, :hear_about_us, :string
    add_column :users, :reason_to_invest, :string
    add_column :users, :current_investments, :string
  end

  def down
    remove_column :users, :country, :text
    remove_column :users, :property_types, :text
    remove_column :users, :budget_range, :text
    remove_column :users, :risk_tolerance, :text
    remove_column :users, :property_categories, :text
    remove_column :users, :invested_in_realestate, :text
    remove_column :users, :hear_about_us, :text
    remove_column :users, :reason_to_invest, :text
    remove_column :users, :current_investments, :text
  end


end
