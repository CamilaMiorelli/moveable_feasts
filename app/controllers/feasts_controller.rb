class FeastsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :home ]
  
  def cancel
    @feast = Feast.find(params[:id])
    @feast.status = "cancelled"
    @feast.save!
    redirect_to feast_path(@feast)
  end

  def show
    @feast = Feast.find(params[:id])
  end

  def home
    @feasts = Feast.all
  end

  def index
    @feasts = Feast.all
  end

  def create
    @feast = Feast.new(strong_feasts_params)
  end

  def new
    @feast = Feast.new
  end

  private
  
  def strong_feasts_params
    params.require(:feast).permit(:title, :description, :meal_type, :guest_limit, :price, :address, :start_at)

  end
end
