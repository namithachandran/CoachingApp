class AddDeviseToCoaches < ActiveRecord::Migration[6.1]
  def self.up
    change_table :coaches do |t|
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
    end

    add_index :coaches, :email, unique: true
    add_index :coaches, :reset_password_token, unique: true
  end
end
