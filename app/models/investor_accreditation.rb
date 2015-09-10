# == Schema Information
#
# Table name: investor_accreditations
#
#  id                    :integer          not null, primary key
#  fund_america_form_url :string
#  status                :string
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class InvestorAccreditation < ActiveRecord::Base
  belongs_to :user
end
