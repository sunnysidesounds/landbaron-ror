class CreatePrincipleInvestors < ActiveRecord::Migration
  def change
    create_table :principle_investors do |t|
      t.integer :investment_id
      t.integer :user_id
      t.string :full_name
      t.string :img_url
      t.text :bio
      t.string :linkedin_url
      t.timestamps
    end
  end

  def down
    drop_table :principle_investors
  end
end


