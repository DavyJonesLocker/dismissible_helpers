# This migration comes from easy_auth_password (originally 20120227014024)
class CreateEasyAuthPassword < ActiveRecord::Migration
  def change
    add_column :identities, :remember_token_digest, :string
    add_column :identities, :reset_token_digest, :string
  end
end
