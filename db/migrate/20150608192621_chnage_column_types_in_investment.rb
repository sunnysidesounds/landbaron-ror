class ChnageColumnTypesInInvestment < ActiveRecord::Migration
  def up
    Investment.all.each do |investment|
      investment.update_attributes(raise_amount: investment.raise_amount.gsub('$', '').to_i, minimum_raise_amount: investment.minimum_raise_amount.gsub('$', '').to_i)
    end
    change_column :investments, :raise_amount, 'decimal USING CAST(raise_amount AS decimal)'
    change_column :investments, :minimum_raise_amount, 'decimal USING CAST(minimum_raise_amount AS decimal)'
  end

  def down
    change_column :investments, :raise_amount, :string
    change_column :investments, :minimum_raise_amount, :string
  end
end
