class AddFundAmericaRelatedFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :date_of_birth, :datetime
    add_column :users, :legal_name, :string
    add_column :users, :tax_id_number, :string
  end
end
