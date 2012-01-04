class Ingredient < ActiveRecord::Base
  has_many :used_ingredients
  has_many :recipes, :through => :used_ingredients
  
  validates_presence_of :name, :entered_amount, :cost
  validates_numericality_of :cost
  
  before_validation :set_units
  
  def set_units
    unless self.entered_amount.blank?
      ruby_unit = Unit.new(self.entered_amount)
      self.amount = ruby_unit.scalar
      self.units = ruby_unit.unit_name
    end
  end
end