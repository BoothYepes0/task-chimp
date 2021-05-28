# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  puts "Creating sample user #{i+1}"
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    username: "#{Faker::Name.name.downcase}_#{i+1}",
    password: "password"
  )
  puts "Creating tasks for user #{i+1}"
  20.times do |i|
    user.tasks.create(
      task_name: "#{user.first_name}'s task #{i+1}",
      category: 0,
      priority: 0
    )
  end
end

user = User.create(
    first_name: "Alice",
    last_name: "Jones",
    email: "alice@example.com",
    username: "ajones",
    password: "password"
  )

20.times do |i|
    user.tasks.create(
      task_name: "#{user.first_name}'s task #{i+1}",
      category: 0,
      priority: 0
    )
end

user = User.create(
    first_name: "Bob",
    last_name: "Jones",
    email: "bob@example.com",
    username: "bjones",
    password: "password"
  )

20.times do |i|
    user.tasks.create(
      task_name: "#{user.first_name}'s task #{i+1}",
      category: 0,
      priority: 0
    )
end