# == Schema Information
#
# Table name: employees
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  email                  :string
#  company_id             :bigint           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  password               :string
#  password_confirmation  :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#

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
