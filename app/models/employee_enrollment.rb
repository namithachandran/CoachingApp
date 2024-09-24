class EmployeeEnrollment < ApplicationRecord
  belongs_to :employee
  belongs_to :coaching_program

  def self.ransackable_attributes(auth_object = nil)
    ["coaching_program_id", "created_at", "employee_id", "id", "updated_at"]
  end
end
