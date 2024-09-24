class Company < ApplicationRecord
    has_many :coaching_programs
    has_many :employees

     # Define the ransackable associations
    def self.ransackable_associations(auth_object = nil)
        ["coaching_programs", "employees"]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "name", "updated_at"]
    end
end
