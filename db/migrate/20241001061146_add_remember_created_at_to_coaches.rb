class AddRememberCreatedAtToCoaches < ActiveRecord::Migration[6.1]
  def change
    add_column :coaches, :remember_created_at, :datetime
  end
end
