class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :reference_id
      t.integer :investment_id
      t.integer :user_id
      t.string :total_amount
      t.string :investor_profile_type
      t.string :status
      t.string :payment_methd
      t.timestamps
    end
  end

  def down
    drop_table :quotes
  end
end
