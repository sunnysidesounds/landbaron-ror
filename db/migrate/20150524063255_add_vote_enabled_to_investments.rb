class AddVoteEnabledToInvestments < ActiveRecord::Migration
  def change
    add_column :investments, :vote_enabled, :integer, :default => 0
  end

  def down
    remove_column :investments, :vote_enabled, :integer
  end

end
