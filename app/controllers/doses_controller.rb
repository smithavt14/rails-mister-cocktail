class DosesController < ApplicationController
  def new
    find_cocktail

    @dose = Dose.new
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    find_cocktail

    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    # @dose.ingredient = Ingredient.find(params[:ingredients_id])

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
