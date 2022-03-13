class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :original, precision: 10, scale: 4
      t.longtext :instructions

      t.timestamps
    end
  end
end
