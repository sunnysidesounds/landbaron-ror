class AddAddressToInvestment < ActiveRecord::Migration
  def change
    add_column :investments, :address, :string
  end
end
