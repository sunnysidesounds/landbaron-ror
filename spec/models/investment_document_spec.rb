# == Schema Information
#
# Table name: media
#
#  id                      :integer          not null, primary key
#  investment_id           :integer
#  path                    :string
#  created_at              :datetime
#  updated_at              :datetime
#  media_item_file_name    :string
#  media_item_content_type :string
#  media_item_file_size    :integer
#  media_item_updated_at   :datetime
#  type                    :string
#

require 'spec_helper'

describe InvestmentDocument do
  pending "add some examples to (or delete) #{__FILE__}"
end
