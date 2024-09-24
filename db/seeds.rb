# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# # Create sample companies
# company1 = Company.create!(name: "Tech Corp", description: "A company focused on technology.")
# company2 = Company.create!(name: "Biz Solutions", description: "Business consulting and solutions.")
# company3 = Company.create!(name: "Health Plus", description: "Healthcare and wellness programs.")

# # Create sample coaching programs
# program1 = company1.coaching_programs.create!(title: "Leadership Development", description: "A program for developing leadership skills.")
# program2 = company1.coaching_programs.create!(title: "Project Management", description: "A program to improve project management skills.")

# # Create sample coaches
# coach1 = Coach.create!(name: "Alice Johnson", email: "alice@coaching.com")
# coach2 = Coach.create!(name: "Bob Smith", email: "bob@coaching.com")
# coach3 = Coach.create!(name: "Charlie Brown", email: "charlie@coaching.com")

# # Assign coaches to coaching programs
# CoachAssignment.create!(coach: coach1, coaching_program: program1)
# CoachAssignment.create!(coach: coach1, coaching_program: program2)

# # Create sample employees
# employee1 = company1.employees.create!(name: "John Doe", email: "john@techcorp.com")
# employee2 = company1.employees.create!(name: "Jane Smith", email: "jane@techcorp.com")
# employee3 = company2.employees.create!(name: "Emily Davis", email: "emily@bizsolutions.com")
# employee4 = company3.employees.create!(name: "Chris Wilson", email: "chris@healthplus.com")

puts "Seeding complete!"