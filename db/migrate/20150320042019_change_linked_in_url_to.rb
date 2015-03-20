class ChangeLinkedInUrlTo < ActiveRecord::Migration
  def change
    rename_column :principle_investors, :linkedin_url, :occupation
  end
end
