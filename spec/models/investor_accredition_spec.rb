# == Schema Information
#
# Table name: investor_accreditions
#
#  id                    :integer          not null, primary key
#  fund_america_form_url :string
#  status                :string
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'spec_helper'

describe InvestorAccredition do
  pending "add some examples to (or delete) #{__FILE__}"
end
