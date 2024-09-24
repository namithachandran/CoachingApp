class CoachingProgram < ApplicationRecord
  has_many :coach_assignments
  has_many :coaches, through: :coach_assignments
  has_many :employee_enrollments
  has_many :employees, through: :employee_enrollments
  belongs_to :company

  def self.ransackable_associations(auth_object = nil)
    ["coach_assignments", "coaches", "company", "employee_enrollments", "employees"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["company_id", "created_at", "description", "end_date", "id", "start_date", "title", "updated_at"]
  end
end
