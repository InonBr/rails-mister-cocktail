class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    new
  end

  def show
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(review_params)

    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:cocktail).permit(:name)
  end
end
