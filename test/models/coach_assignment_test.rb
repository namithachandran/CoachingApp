# == Schema Information
#
# Table name: coach_assignments
#
#  id                  :bigint           not null, primary key
#  coach_id            :bigint           not null
#  coaching_program_id :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require "test_helper"

class CoachAssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
