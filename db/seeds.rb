require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

puts "Destroying Database"
Ingredient.destroy_all

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient.values.join)
end

puts "Creating a bunch of ingredients"

url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s='
a = open(url).read
response = JSON.parse(a)

puts "Destroying Cocktails"
Cocktail.destroy_all


file = File.join(Rails.root, 'db', 'cocktail_names.json')
a = File.read(file)
cocktail_names = JSON.parse(a)

cocktail_names.each do |cocktail|
  Cocktail.create(name: cocktail['name'])
end
