# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  investment_id :integer
#  user_id       :integer
#  value         :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Vote do
  pending "add some examples to (or delete) #{__FILE__}"
end
