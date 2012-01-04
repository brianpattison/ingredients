class Ingredient < ActiveRecord::Base
  has_many :used_ingredients
  has_many :recipes, :through => :used_ingredients
end