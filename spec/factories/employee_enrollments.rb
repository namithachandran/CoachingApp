FactoryBot.define do
    factory :employee_enrollment do
      association :employee
      association :coaching_program
  
      created_at { Time.now }
      updated_at { Time.now }
    end
  end
  