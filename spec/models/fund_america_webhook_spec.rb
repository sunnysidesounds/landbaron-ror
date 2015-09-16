# == Schema Information
#
# Table name: fund_america_webhooks
#
#  id             :integer          not null, primary key
#  object_type    :string
#  action_id      :string
#  url            :string
#  webhook_id     :string
#  signature      :string
#  action         :string
#  entity_id      :string
#  changes_fields :string
#  processed      :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe FundAmericaWebhook do
  pending "add some examples to (or delete) #{__FILE__}"
end
