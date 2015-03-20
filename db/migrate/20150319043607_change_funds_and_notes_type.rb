class ChangeFundsAndNotesType < ActiveRecord::Migration
  def change
    change_column :investments, :fee_structure, :text
    change_column :investments, :note, :text
  end

  def down
    change_column :investments, :fee_structure, :string
    change_column :investments, :note, :string
  end

end
