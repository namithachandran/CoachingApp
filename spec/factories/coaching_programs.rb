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

FactoryBot.define do
    factory :coaching_program do
      title { "Leadership Coaching" }
      description { "A program to enhance leadership skills." }
      start_date { Date.today }
      end_date { Date.today + 30.days }
      association :company
  end
end
