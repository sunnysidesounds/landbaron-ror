class CreateInvestmentsInevestmentQuestions < ActiveRecord::Migration
  def change
    create_table :investment_questions_investments, id: false do |t|
      t.belongs_to :investment_question
      t.belongs_to :investment
    end
  end
end
