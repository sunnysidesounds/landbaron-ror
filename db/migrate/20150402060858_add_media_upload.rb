class AddMediaUpload < ActiveRecord::Migration
  def self.up
    add_attachment :media, :media_item
  end

  def self.down
    remove_attachment :media, :media_item
  end
end
