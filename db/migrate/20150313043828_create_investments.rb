class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.string :name
      t.string :logo_link
      t.string :investment_type
      t.string :raise_amount
      t.string :minimum_raise_amount
      t.string :investment_duration
      t.string :video_link
      t.string :status
      t.string :risk_rating
      t.text :key_information
      t.integer :photos_link_id
      t.integer :principle_bio_id
      t.string :investment_minimum
      t.string :fee_structure
      t.string :note
      t.integer :spots_available
      t.integer :qa_id
      t.integer :legal_documents_id
      t.timestamps
    end
  end

  def down
    drop_table :investments
  end


end
