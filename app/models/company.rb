class Company < ApplicationRecord
    has_many :coaching_programs
    has_many :employees
end
