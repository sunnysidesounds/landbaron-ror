# == Schema Information
#
# Table name: principle_investors
#
#  id                       :integer          not null, primary key
#  investment_id            :integer
#  user_id                  :integer
#  full_name                :string
#  img_url                  :string
#  bio                      :text
#  occupation               :string
#  created_at               :datetime
#  updated_at               :datetime
#  profile_pic_file_name    :string
#  profile_pic_content_type :string
#  profile_pic_file_size    :integer
#  profile_pic_updated_at   :datetime
#

require 'spec_helper'

describe PrincipleInvestor do
  pending "add some examples to (or delete) #{__FILE__}"
end
