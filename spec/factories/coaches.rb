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


FactoryBot.define do
    factory :coach do
      name { "John Doe" }
      email { "john.doe@example.com" }
      bio { "Experienced coach with a passion for helping others." }
      password { "password123" }
      password_confirmation { "password123" }
      encrypted_password { Devise::Encryptor.digest(Employee, "password123") }
      created_at { nil }
      updated_at { nil }
    end
  end
  
