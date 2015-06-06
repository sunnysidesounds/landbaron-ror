# == Schema Information
#
# Table name: quotes
#
#  id                    :integer          not null, primary key
#  reference_id          :string
#  investment_id         :integer
#  user_id               :integer
#  total_amount          :string
#  investor_profile_type :string
#  status                :string
#  payment_methd         :string
#  created_at            :datetime
#  updated_at            :datetime
#

require 'spec_helper'

describe Quote do
  pending "add some examples to (or delete) #{__FILE__}"
end
