class Employee < ApplicationRecord

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  belongs_to :company
  has_many :employee_enrollments
  has_many :coaching_programs, through: :employee_enrollments
  

  def self.ransackable_attributes(auth_object = nil)
    ["company_id", "created_at", "email", "id", "name", "updated_at"]
  end

  #validations
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
end
