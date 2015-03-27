class AddLogoToInvestments < ActiveRecord::Migration
  def self.up
    add_attachment :investments, :logo
  end

  def self.down
    remove_attachment :investments, :logo
  end
end
