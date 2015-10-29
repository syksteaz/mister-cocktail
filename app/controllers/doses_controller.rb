class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
    # @ingredient = @cocktail.ingredients.create(ingredient_params
      # Pas necessaire de créer un @ingredient, on le récupère des dose params
    # STOP ICI : comment créer ma @dose avec dose_params & ingredient_params ?
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to :back
  end


private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:ingredient_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  # def ingredient_params
  #   params.require(:ingredient).permit(:name)
  # end

end

