class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_token
      t.string :token_salt
      t.integer :authentications

      t.timestamps
    end
  end
end
