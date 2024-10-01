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

class Company < ApplicationRecord
    has_many :coaching_programs
    has_many :employees

    def self.ransackable_associations(auth_object = nil)
        ["coaching_programs", "employees"]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "name", "updated_at"]
    end
end
