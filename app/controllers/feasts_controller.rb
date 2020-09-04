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
    @reservations = @feast.reservations
    @reservation = current_user.reservations.find_by(feast: @feast)
    @feast = Feast.find(params[:id]).includes(:reservations)
    @markers =
        {
          lat: @feast.latitude,
          lng: @feast.longitude
        }
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
    if params[:query].present?
      sql_query = "title ILIKE :query OR description @@ :query OR address ILIKE :query OR meal_type ILIKE :query"
      @feasts = Feast.where(sql_query, query: "%#{params[:query]}%")
      @markers = @feasts.geocoded.map do |feast|
        {
          lat: feast.latitude,
          lng: feast.longitude,
          # infoWindow: render_to_string(partial: "infowindow", locals: { feast: feast }),
          # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
        }
      end
    else
      @feasts = Feast.all
      @markers = @feasts.geocoded.map do |feast|
        {
          lat: feast.latitude,
          lng: feast.longitude,
          # infoWindow: render_to_string(partial: "infowindow", locals: { feast: feast }),
          # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
        }
      end
    end
  end

  def create
    @feast = Feast.new(strong_feasts_params)
    @feast.save!
  end

  def new
    @feast = Feast.new
  end

  def update
    @feast = Feast.find(params[:id])
    @feast.save(strong_feasts_params)
  end

  private

  def strong_feasts_params
    params.require(:feast).permit(:title, :description, :meal_type, :guest_limit, :price, :address, :start_at, :photo)

  end
end
