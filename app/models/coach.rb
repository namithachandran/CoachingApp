class Coach < ApplicationRecord
    devise :database_authenticatable, :recoverable, :rememberable, :validatable

    has_many :coach_assignments
    has_many :coaching_programs, through: :coach_assignments
end
