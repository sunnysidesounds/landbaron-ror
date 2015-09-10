class CreateInvestorAccreditations < ActiveRecord::Migration
  def change
    create_table :investor_accreditations do |t|
      t.string :fund_america_form_url
      t.string :status
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
