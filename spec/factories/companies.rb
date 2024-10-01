# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
    factory :company do
      name { "Tech Corp" }
      description { "123 Tech Lane" }
    end
  end
