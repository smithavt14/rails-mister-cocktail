require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)


Ingredient.destroy_all

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient.values.join)
end
