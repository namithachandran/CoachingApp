class CreateCoachingPrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :coaching_programs do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
