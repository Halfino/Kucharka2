class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.decimal :amount, precision: 10, scale: 4
      t.belongs_to :recipe, null: false, foreign_key: true
      t.belongs_to :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
