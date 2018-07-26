class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true
  validates :cocktail, uniqueness: {scope: :ingredient}, presence: true
  validates :ingredient, presence: true
end

# A dose must have a description, a cocktail and an ingredient, and [cocktail, ingredient] pairings should be unique.
