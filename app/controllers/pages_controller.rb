class PagesController < ApplicationController
  def home
  end

  def recipe_list
    @recipes = Recipe.all
  end

  def calculated
    @recipe = Recipe.find(params[:recipe])
    @request = params[:query].to_f
    @constant = @request / @recipe.original
  end

  def recipe
    @recipe = Recipe.find(params[:id])
  end
end
