ActiveAdmin.register Recipe do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :original, :instructions
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :original, :instructions]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name,:original,:instructions,
                recipe_ingredients_attributes: [:amount, :unit, :description, :_destroy, :id,:ingredient_id,
                                                ingredient_attributes: [:name, :id]]


  form do |f|
    f.inputs 'Zaklad' do
      f.input :name
      f.input :original
      f.input :instructions, as: :quill_editor
    end
    f.inputs 'Suroviny' do
      f.has_many :recipe_ingredients do |t|
        t.input :amount
        t.input :unit
        t.input :ingredient
      end
    end

    f.actions
  end

  show do
    panel "Zaklad" do
      attributes_table_for recipe do
        row ("Nazev") {recipe.name}
        row ("Referencni vaha KG") {recipe.original}
        row ("Postup") {recipe.instructions.html_safe}
      end
    end
    panel "Ingredience" do
      recipe.recipe_ingredients.each do |rec|
        div do
          "#{rec.ingredient.name}: #{rec.amount} #{rec.unit}"
        end
      end
    end
  end
end
