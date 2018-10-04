# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  activity = Faker::Lorem.sentence(5)
  type_gained = Faker::Boolean.boolean
  number = Faker::Number.normal(2, 0.8)
  date = Faker::Time.between(30.days.ago, Date.today, :all)
  users.each { |user| user.calories.create!(activity: activity,
                                            type_gained: type_gained,
                                            number: number,
                                            date: date) }
end