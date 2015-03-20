class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :investment_id
      t.string :path
      t.timestamps
    end
  end
end
