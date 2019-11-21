# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'

puts 'kill Cocktail and Ingredient'
Ingredient.delete_all
Cocktail.delete_all

puts 'start Cocktail'

Cocktail.create(name: 'Margarita')
Cocktail.create(name: 'Mojito')
Cocktail.create(name: 'Gin and Tonic')
Cocktail.create(name: 'Manhattan')
Cocktail.create(name: 'Bloody Mary')

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = URI.open(url).read
data = JSON.parse(drinks)

puts 'start Ingredient'

data['drinks'].each do |array|
  puts
  puts 'seeding...'
  Ingredient.create(name: array['strIngredient1'])
  puts 'seeding... next'
end
puts 'END...'
