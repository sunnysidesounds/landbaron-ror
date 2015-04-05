class AddSpotsHaveForInvestments < ActiveRecord::Migration
  def change
    add_column :investments, :spots_have, :string, :before => :spots_available
  end

  def down
    remove_column :investments, :spots_have, :string
  end
end



