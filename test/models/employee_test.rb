# == Schema Information
#
# Table name: employees
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  email                  :string
#  company_id             :bigint           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  password               :string
#  password_confirmation  :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#

require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
