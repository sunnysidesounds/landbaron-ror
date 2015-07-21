# == Schema Information
#
# Table name: investments
#
#  id                   :integer          not null, primary key
#  name                 :string
#  logo_link            :string
#  investment_type      :string
#  raise_amount         :decimal(, )
#  minimum_raise_amount :decimal(, )
#  investment_duration  :string
#  video_link           :string
#  status               :string
#  risk_rating          :string
#  key_information      :text
#  photos_link_id       :integer
#  principle_bio_id     :integer
#  investment_minimum   :string
#  fee_structure        :text
#  note                 :text
#  spots_available      :integer
#  qa_id                :integer
#  legal_documents_id   :integer
#  created_at           :datetime
#  updated_at           :datetime
#  qa                   :text
#  logo_file_name       :string
#  logo_content_type    :string
#  logo_file_size       :integer
#  logo_updated_at      :datetime
#  spots_have           :string
#  vote_enabled         :integer          default(0)
#  address              :string
#

require 'spec_helper'

describe Investment do
  pending "add some examples to (or delete) #{__FILE__}"
end
