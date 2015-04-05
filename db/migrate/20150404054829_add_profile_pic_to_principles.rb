class AddProfilePicToPrinciples < ActiveRecord::Migration
  def self.up
    add_attachment :principle_investors, :profile_pic
  end

  def self.down
    remove_attachment :principle_investors, :profile_pic
  end
end
