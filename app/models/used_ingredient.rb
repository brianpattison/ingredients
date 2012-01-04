class UsedIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  
  validates_presence_of :ingredient, :entered_amount
  validate :units_must_be_compatible_with_purchased_units
  
  before_validation :set_units
  
  def cost
    return (Unit.new(self.entered_amount) / Unit.new(self.ingredient.entered_amount)).base_scalar * self.ingredient.cost
  end
  
  def units_must_be_compatible_with_purchased_units
    unless self.entered_amount.blank?
      used_units = Unit.new(self.entered_amount)
      purchased_units = Unit.new(self.ingredient.entered_amount)
      unit_name = purchased_units.unit_name
      unit_name = 'no units' if !unit_name
      errors.add(:entered_amount, "units must be compatible with purchased units (#{unit_name})") unless used_units =~ purchased_units
    end
  end
  
  def set_units
    unless self.entered_amount.blank?
      ruby_unit = Unit.new(self.entered_amount)
      self.amount = ruby_unit.scalar
      self.units = ruby_unit.unit_name
    end
  end
end