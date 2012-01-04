class Recipe < ActiveRecord::Base
  has_many :used_ingredients
  has_many :ingredients, :through => :used_ingredients
  
  validates_presence_of :name, :yield
  validates_numericality_of :yield
  
  def cost
    cost = 0
    self.used_ingredients.each do |used_ingredient|
      cost += used_ingredient.cost
    end
    return cost
  end
  
  def cost_each
    return self.cost/self.yield
  end
end