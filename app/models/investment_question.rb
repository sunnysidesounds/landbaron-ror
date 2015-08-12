# == Schema Information
#
# Table name: investment_questions
#
#  id         :integer          not null, primary key
#  question   :string
#  answer     :text
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class InvestmentQuestion < ActiveRecord::Base
  has_and_belongs_to_many :investments
end
