class CreateCoachAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :coach_assignments do |t|
      t.references :coach, null: false, foreign_key: true
      t.references :coaching_program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
