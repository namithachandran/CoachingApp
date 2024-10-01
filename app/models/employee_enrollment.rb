# == Schema Information
#
# Table name: employee_enrollments
#
#  id                  :bigint           not null, primary key
#  employee_id         :bigint           not null
#  coaching_program_id :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class EmployeeEnrollment < ApplicationRecord
  belongs_to :employee
  belongs_to :coaching_program

  def self.ransackable_attributes(auth_object = nil)
    ["coaching_program_id", "created_at", "employee_id", "id", "updated_at"]
  end
end
