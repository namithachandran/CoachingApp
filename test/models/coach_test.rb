# == Schema Information
#
# Table name: coaches
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  email                  :string
#  bio                    :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#

require "test_helper"

class CoachTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
