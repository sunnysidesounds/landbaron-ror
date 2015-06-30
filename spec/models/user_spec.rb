# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string
#  email                  :string
#  first_name             :string
#  last_name              :string
#  password_hash          :string
#  password_salt          :string
#  phone_number           :string
#  address                :string
#  city                   :string
#  state                  :string
#  postal_code            :string
#  income_range           :string
#  principle_investor     :boolean
#  verified               :boolean
#  created_at             :datetime
#  updated_at             :datetime
#  encrypted_password     :string           default(""), not null
#  password_migrated      :boolean          default(TRUE)
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

describe User do

  it { should have_many :orders }
  it { should respond_to :email }

end
