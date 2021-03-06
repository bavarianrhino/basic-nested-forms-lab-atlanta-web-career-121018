class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def create
      @recipe = Recipe.create(recipes_params)
      redirect_to recipes_path
  end

  private
  def recipes_params
      params.require(:recipe).permit( :title,
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )
end
end


# create_table "ingredients", force: :cascade do |t|
#   t.string   "name"
#   t.string   "quantity"
#   t.integer  "recipe_id"
# end
#
# create_table "recipes", force: :cascade do |t|
#   t.string   "title"
# end
