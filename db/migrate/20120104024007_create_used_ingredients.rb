class CreateUsedIngredients < ActiveRecord::Migration
  def change
    create_table :used_ingredients do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.string :entered_amount
      t.float :amount
      t.string :units

      t.timestamps
    end
  end
end
