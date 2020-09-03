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
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @feasts = Feast.where(sql_query, query: "%#{params[:query]}%")
    else
      @feasts = Feast.all
    end
  end

  def index
    raise
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @feasts = Feast.where(sql_query, query: "%#{params[:query]}%")
    end
    else
      @feasts = Feast.all
            @markers = @feasts.geocoded.map do |feast|
      {
        lat: feast.latitude
        lng: feast.longitude
      }
    end
  end

  def create
    @feast = Feast.new(strong_feasts_params)
    @feast.save!
  end

  def new
    @feast = Feast.new
  end

  private

  def strong_feasts_params
    params.require(:feast).permit(:title, :description, :meal_type, :guest_limit, :price, :address, :start_at, :photo)

  end
end
