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

require "test_helper"

class EmployeeEnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
