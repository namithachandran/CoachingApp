class CoachAssignment < ApplicationRecord
  belongs_to :coach
  belongs_to :coaching_program

  def self.ransackable_associations(auth_object = nil)
    ["coach", "coaching_program"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["coach_id", "coaching_program_id", "created_at", "id", "updated_at"]
  end
end
