class AddIsOriginalToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :is_orginial, :bool
  end
end
