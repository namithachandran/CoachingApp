FactoryBot.define do
    factory :coaching_program do
      title { "Leadership Coaching" }
      description { "A program to enhance leadership skills." }
      start_date { Date.today }
      end_date { Date.today + 30.days }
      association :company
  end
end
