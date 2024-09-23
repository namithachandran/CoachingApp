class CoachingProgram < ApplicationRecord
  has_many :coach_assignments
  has_many :coaches, through: :coach_assignments
  has_many :employee_enrollments
  has_many :employees, through: :employee_enrollments
  belongs_to :company
end
