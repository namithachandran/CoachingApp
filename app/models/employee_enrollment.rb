class EmployeeEnrollment < ApplicationRecord
  belongs_to :employee
  belongs_to :coaching_program
end
