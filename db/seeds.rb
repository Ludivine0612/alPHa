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
firstnames = ["Elodie", "Ludivine", "Marie", "Margot", "Justine", "Lea", "Marjo", "Christine", "Georgette", "Emma", "Marion","Jonathan","Xavier","Julien","Caroline"]
15.times do |index|
  User.create!(
    first_name: firstnames[index],
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    phone_number: Faker::Number.leading_zero_number(10),
    email: Faker::Internet.email,
    password: "toto13"
  )
end

puts "creating ADMIN users..."
  User.create!(
    first_name: "Damien",
    last_name: "Delahaye",
    address: "47 rue Mazenod, 13002 Marseille" ,
    phone_number: "0622836301",
    email: "admin@gmail.com",
    password: "toto13"
  )

puts "creating companies..."
  Company.create!(
    siret: Faker::Number.leading_zero_number(10),
    name: "Perfect Home",
    boss: User.find_by_first_name("Damien")
    )


puts "creating activities..."
tasks = ["ménage", "jardinage", "bricolage", "nettoyage", "électricité", "cuisine"]
6.times do |index|
  Activity.create!(
    name: tasks[index]
  )
end

puts "creating jobs..."
employees = User.all.select{ |user| user.companies.length == 0 }.sample(5)
5.times do |index|
  new_job = Job.create!(
    employee: employees[index],
    company: Company.find_by_name("Perfect Home")
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
    .sample(5)
location = ["7 Boulevard Louis Blanc, 83990 Saint-Tropez","1817 Route des Plages, 83350 Ramatuelle","15 Chemin du Pinet, 83990 Saint-tropez","22 Chemin des Salins, 83990 Saint-Tropez","31-18 Rue de la Resistance, 83990 Saint-Tropez"]
3.times do |index|
  date = Faker::Date.forward(30)
  new_booking = Booking.create!(
    start_date: date,
    end_date: date+(1..5).to_a.sample,
    location: location[index],
    company: Company.find_by_name("Perfect Home"),
    client: clients[index]
    )
  job = new_booking.company.jobs[index]
  descriptions = {
    "ménage" => ["Nettoyer la piscine et cuisine en priorité", "Passer la serpillère et ranger les chambres"],
    "jardinage" => ["Couper les arbustes, passer la tondeuse", "Tailler les buissons, entretenir le jardin"],
    "bricolage" => ["Réparer la fuite de la salle de bain", "Problème avec le meuble de la salle à manger"],
    "nettoyage" => ["Vider la piscine et nettoyer le liner", "Nettoyer les fenêtres"],
    "électricité" => ["Préparer l'éclairage pour les décorations de Noël", "Problème réseau télé"],
    "cuisine" => ["Préparer le repas des enfants à déjeuner", "Prévoir un repas pour 15 invités"]
  }
    activity = job.activities.sample
    Prestation.create!(
    booking: new_booking,
    job: job,
    activity: activity,
    description: descriptions[activity.name].sample
    )

end

2.times do |index|
  date = Faker::Date.forward(30)
  new_booking = Booking.create!(
    start_date: date,
    end_date: date+(1..5).to_a.sample,
    location: location[index],
    company: Company.find_by_name("Perfect Home"),
    client: clients[index]
    )
  activities = Company.find_by_name("Perfect Home").jobs.map {|job| job.activities}.flatten.uniq
  descriptions = {
   "ménage" => ["Nettoyer la piscine et cuisine en priorité", "Passer la serpillère et ranger les chambres"],
    "jardinage" => ["Couper les arbustes, passer la tondeuse", "Tailler les buissons, entretenir le jardin"],
    "bricolage" => ["Réparer la fuite de la salle de bain", "Problème avec le meuble de la salle à manger"],
    "nettoyage" => ["Vider la piscine et nettoyer le liner", "Nettoyer les fenêtres"],
    "électricité" => ["Préparer l'éclairage pour les décorations de Noël", "Problème réseau télé"],
    "cuisine" => ["Préparer le repas des enfants à déjeuner", "Prévoir un repas pour 15 invités"]
  }
    activity = activities.sample
    Prestation.create!(
    booking: new_booking,
    activity: activity,
    description: descriptions[activity.name].sample
    )
end






