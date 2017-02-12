class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false

      t.string :name, null: false

      t.string :picture, null: false

      t.string :account_id, null: false

      t.string :api_authtoken
      t.datetime :authtoken_expiry

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :account_id, unique: true
  end
end
