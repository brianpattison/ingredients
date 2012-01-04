class Recipe < ActiveRecord::Base
  has_many :used_ingredients
  has_many :ingredients, :through => :used_ingredients
end