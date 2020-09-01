class FeastsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :home ]
  def cancel
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

  private
  
  def strong_feasts_params
    params.require(:feast).permit(:title, :description, :meal_type, :guest_limit, :price, :address, :start_at)

  end
end
