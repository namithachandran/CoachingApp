class Coach < ApplicationRecord
    devise :database_authenticatable, :recoverable, :rememberable, :validatable

    has_many :coach_assignments
    has_many :coaching_programs, through: :coach_assignments

    def self.ransackable_associations(auth_object = nil)
        ["coach_assignments", "coaching_programs"]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["bio", "created_at", "email", "encrypted_password", "id", "name", "reset_password_sent_at", "reset_password_token", "updated_at"]
    end
end
