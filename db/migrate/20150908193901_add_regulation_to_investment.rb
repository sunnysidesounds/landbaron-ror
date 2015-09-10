class AddRegulationToInvestment < ActiveRecord::Migration
  def change
    add_column :investments, :regulation, :string
  end
end
