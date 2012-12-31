# This migration comes from easy_auth (originally 20120227014023)
class CreateEasyAuthIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string  :username
      t.string  :token
      t.string  :account_type
      t.integer :account_id
      t.string  :reset_token
      t.string  :remember_token
      t.string  :type
      t.timestamps
    end

    [:username, :reset_token, :remember_token].each do |column|
      add_index :identities, column
    end
  end
end
