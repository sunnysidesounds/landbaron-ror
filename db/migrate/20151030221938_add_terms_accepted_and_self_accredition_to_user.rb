class AddTermsAcceptedAndSelfAccreditionToUser < ActiveRecord::Migration
  def change
    add_column :users, :terms_accepted, :boolean
    add_column :users, :self_accredition, :string
  end
end
