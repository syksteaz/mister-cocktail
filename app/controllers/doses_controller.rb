class DosesController < ApplicationController
  before_action :find_cocktail_and_ingredient, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.create(dose_params)
    # @ingredient = @cocktail.ingredients.create(ingredient_params
      # Pas necessaire de créer un @ingredient, on le récupère des dose params
    # STOP ICI : comment créer ma @dose avec dose_params & ingredient_params ?
  end

  def delete
  end


private

  def find_cocktail_and_ingredient
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:ingredient_id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end

  # def ingredient_params
  #   params.require(:ingredient).permit(:name)
  # end

end

