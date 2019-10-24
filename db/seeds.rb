# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'

Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all
City.destroy_all

puts "tout a été détruit"

4.times do 
	City.create!(city_name: Faker::Address.city)
end	
puts "villes créées"

20.times do 
	Dog.create!(name: Faker::Name.first_name, city_id: City.all.sample.id)
	Dogsitter.create!(name: Faker::Name.first_name, city_id: City.all.sample.id)
end	
puts "chiens et dogsitters créés"

City.all.each do |city|
	i = city.id
	2.times do #les where sont utilisés pour qu'une promenade ne puisse pas avoir lieu pour un chien et un dogsitter qui ne sont pas dans la meme ville
		Stroll.create!(date: Faker::Date.in_date_period, dog_id: Dog.where(city_id: i).sample.id, dogsitter_id: Dogsitter.where(city_id: i).sample.id)
	end
end
puts "promenades créées"