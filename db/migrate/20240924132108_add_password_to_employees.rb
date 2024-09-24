class AddPasswordToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :password, :string
    add_column :employees, :password_confirmation, :string
  end
end
