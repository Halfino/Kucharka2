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
  permit_params :name,:original,:instructions,:category, :is_orginial,
                recipe_ingredients_attributes: [:amount, :unit, :description, :_destroy, :id,:ingredient_id,
                                                ingredient_attributes: [:name, :id]]


  index do
    selectable_column
    index_column
    column "Nazev", :name
    column "Pocet ingredienci",:recipe_ingredients do |n|
      n.recipe_ingredients.size
    end
    column "Normovany recept", :is_orginial
    actions defaults: false do |recipe|
      item "edit", edit_admin_recipe_path(recipe)
    end
  end

  form do |f|
    f.inputs 'Zaklad' do
      f.input :name, :label => "Nazev receptu"
      f.input :original, :label => "Referencni vaha"
      f.input :is_orginial, :label => "Normovany recept"
      f.input :category, :label => "Kategorie"
      f.input :instructions, as: :quill_editor, :label => "Postup"
    end
    f.inputs 'Suroviny' do
      f.has_many :recipe_ingredients do |t|
        t.input :ingredient, :label => "Ingredience"
        t.input :amount , :label => "Mnozstvi"
        t.input :unit, :label => "Jednotka"
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
