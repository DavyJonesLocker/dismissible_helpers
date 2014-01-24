# This migration comes from easy_auth (originally 20120227014023)
class CreateEasyAuthIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string  :uid, array: true, default: []
      t.string  :token
      t.string  :account_type
      t.integer :account_id
      t.string  :type
      t.timestamps
    end

    add_index :identities, :uid, using: :gin
  end
end
