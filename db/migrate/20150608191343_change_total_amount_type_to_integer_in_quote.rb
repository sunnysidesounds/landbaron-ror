class ChangeTotalAmountTypeToIntegerInQuote < ActiveRecord::Migration
  def up
    Quote.all.each do |quote|
      new_amount = quote.total_amount.gsub('$', '').to_i
      quote.update_attributes(total_amount: new_amount)
    end
    change_column :quotes, :total_amount, 'decimal USING CAST(total_amount AS decimal)'
  end

  def down
    change_column :quotes, :total_amount, :string
  end
end
