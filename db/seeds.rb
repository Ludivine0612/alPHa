# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Prestation.destroy_all
Booking.destroy_all
Skill.destroy_all
Job.destroy_all
Activity.destroy_all
Company.destroy_all
User.destroy_all

puts "creating users..."
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    phone_number: Faker::Number.leading_zero_number(10),
    email: Faker::Internet.email,
    password: "toto13"
  )
end

puts "creating companies..."
3.times do
  Company.create!(
    siret: Faker::Number.leading_zero_number(10),
    name: Faker::Company.name,
    boss: User.all.sample
    )
end

puts "creating activities..."
tasks = ["ménage", "jardinage", "bricolage", "nettoyage", "électricité", "massage"]
6.times do |index|
  Activity.create(
    name: tasks[index]
  )
end

puts "creating jobs..."
employees = User.all.select{ |user| user.companies.length == 0 }.sample(3)
3.times do |index|
  new_job = Job.create!(
    employee: employees[index],
    company: Company.all.sample
    )
  activities = Activity.all.sample(2)
  2.times do |index|
    Skill.create!(
      job: new_job,
      activity: activities[index]
      )
  end
end


puts "creating bookings..."
clients = User.all
    .select{ |user| user.companies.length == 0 }
    .select{ |user| user.jobs.length == 0 }
    .sample(3)
3.times do |index|
  date = Faker::Date.forward(30)
  new_booking = Booking.create!(
    start_date: date,
    end_date: date+1,
    location: Faker::Address.street_address,
    company: Company.all.select {|company| company.jobs.length >= 1}.sample,
    client: clients[index]
    )
  job = new_booking.company.jobs.first
  Prestation.create!(
    description: Faker::ChuckNorris.fact,
    booking: new_booking,
    job: job,
    activity: job.activities.first
    )
end






