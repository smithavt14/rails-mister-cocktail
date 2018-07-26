class CocktailsController < ApplicationController
  before_action :find_cocktail
  def index
    @cocktails = Cocktail.all
    #
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.dose = Cocktail.find(params[:cocktail_id])
    @cocktail.save
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:content)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
