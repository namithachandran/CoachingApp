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

class Coach < ApplicationRecord
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

    has_many :coach_assignments
    has_many :coaching_programs, through: :coach_assignments

    def self.ransackable_associations(auth_object = nil)
        ["coach_assignments", "coaching_programs"]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["bio", "created_at", "email", "encrypted_password", "id", "name", "reset_password_sent_at", "reset_password_token", "updated_at"]
    end
end
