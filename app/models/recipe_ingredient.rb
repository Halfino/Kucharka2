class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  accepts_nested_attributes_for :ingredient, allow_destroy: true

  extend Enumerize

  enumerize :unit, in: [:kg, :g, :ml, :l]

end
