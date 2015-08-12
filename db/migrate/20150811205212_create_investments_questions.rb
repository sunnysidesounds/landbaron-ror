class CreateInvestmentsQuestions < ActiveRecord::Migration
  def change
    create_table :investment_questions do |t|
      t.string :question
      t.text :answer
      t.integer :order

      t.timestamps null: false
    end
  end
end
