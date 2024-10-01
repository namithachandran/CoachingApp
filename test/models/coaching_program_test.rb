# == Schema Information
#
# Table name: coaching_programs
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  start_date  :date
#  end_date    :date
#  company_id  :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "test_helper"

class CoachingProgramTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
