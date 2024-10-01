FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    company 
    password { "password123" }
    password_confirmation { "password123" }
    encrypted_password { Devise::Encryptor.digest(Employee, "password123") } 

    # Optional fields for sign-in and password recovery
    reset_password_token { nil }
    reset_password_sent_at { nil }
    remember_created_at { nil }
    sign_in_count { 0 }
    current_sign_in_at { nil }
    last_sign_in_at { nil }
    current_sign_in_ip { nil }
    last_sign_in_ip { nil }
  end
end
