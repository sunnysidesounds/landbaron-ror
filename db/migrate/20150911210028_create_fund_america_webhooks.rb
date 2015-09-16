class CreateFundAmericaWebhooks < ActiveRecord::Migration
  def change
    create_table :fund_america_webhooks do |t|
      t.string :object_type
      t.string :action_id
      t.string :url
      t.string :webhook_id
      t.string :signature
      t.string :action
      t.string :entity_id
      t.string :changes_fields
      t.boolean :processed, default: false
      t.timestamps null: false
    end
  end
end
