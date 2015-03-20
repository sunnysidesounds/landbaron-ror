class AddQaColumn < ActiveRecord::Migration
  def change
     add_column :investments, :qa, :text, :before => :note
  end

  def down
     remove_column :investments, :qa, :text
  end
end



