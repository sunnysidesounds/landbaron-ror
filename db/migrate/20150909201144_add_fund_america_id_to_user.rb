class AddFundAmericaIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :fund_america_id, :string
  end
end
