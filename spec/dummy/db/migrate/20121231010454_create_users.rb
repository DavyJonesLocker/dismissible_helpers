class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :session_token
      t.text :dismissed_helpers

      t.timestamps
    end
  end
end
