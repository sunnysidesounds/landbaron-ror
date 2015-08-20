class AddMarketoAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :annual_income_without_taxes, :string
    add_column :users, :describes_you, :string
    add_column :users, :marketo_lead_id, :string
  end
end
