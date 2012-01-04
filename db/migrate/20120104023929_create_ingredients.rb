class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :entered_amount
      t.float :cost
      t.float :amount
      t.string :units

      t.timestamps
    end
  end
end
