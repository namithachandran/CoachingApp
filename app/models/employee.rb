class Employee < ApplicationRecord

  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  
  belongs_to :company
  has_many :employee_enrollments
  has_many :coaching_programs, through: :employee_enrollments
end
