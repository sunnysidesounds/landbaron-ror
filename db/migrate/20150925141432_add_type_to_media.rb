class AddTypeToMedia < ActiveRecord::Migration
  def change
    add_column :media, :type, :string
    Medium.where(type:nil).update_all(type: "InvestmentImage")
  end
end
