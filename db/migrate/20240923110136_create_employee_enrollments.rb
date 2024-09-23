class CreateEmployeeEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_enrollments do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :coaching_program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
