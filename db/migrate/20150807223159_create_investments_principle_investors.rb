class CreateInvestmentsPrincipleInvestors < ActiveRecord::Migration
  def change
    create_table :investments_principle_investors, id: false do |t|
      t.belongs_to :principle_investor, index: true
      t.belongs_to :investment, index: true
    end
  end
end
