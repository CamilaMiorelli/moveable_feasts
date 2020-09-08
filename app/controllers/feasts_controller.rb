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
    @reservation = current_user.reservations.find_by(feast: @feast) if current_user
    # if @reservation == "Accepted"
    #   @feast.reservations.to_a.sum(&:number_of_guests)
    # end
    @marker =
        [{
          lat: @feast.latitude,
          lng: @feast.longitude
        }]
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
    if params[:date_query].blank? && params[:query].blank?
      @feasts = Feast.all

    elsif params[:query].present? && params[:date_query].blank?
      sql_query = "title ILIKE :query OR description @@ :query OR address ILIKE :query OR meal_type ILIKE :query"
       @feasts = Feast.where(sql_query, query: "%#{params[:query]}%")
    elsif params[:query].blank? && params[:date_query].present?
      @feasts = Feast.where(start_at: params[:date_query].to_date..params[:date_query].to_date.end_of_day)

    else
      @feasts = Feast.where(start_at: params[:date_query].to_date..params[:date_query].to_date.end_of_day)
      sql_query = "title ILIKE :query OR description @@ :query OR address ILIKE :query OR meal_type ILIKE :query"
      @feasts = @feasts.where(sql_query, query: "%#{params[:query]}%")
    # if params[:query].present? or params[:date_query].present?
    #   sql_query = "title ILIKE :query OR description @@ :query OR address ILIKE :query OR meal_type ILIKE :query"
    #   @feasts = Feast.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @feasts = Feast.all
    end
      @markers = @feasts.geocoded.map do |feast|
        {
          lat: feast.latitude,
          lng: feast.longitude
          # infoWindow: render_to_string(partial: "infowindow", locals: { feast: feast }),
          # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
        }
      end
  end

  def create
    @feast = Feast.new(strong_feasts_params)
    @feast.user = current_user
    @feast.save
    if @feast.save
        redirect_to feast_path(@feast)
        flash.notice = "You have created a new event."
    else
      render :new
      flash.alert = "Your event did not save."
    end
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
    params.require(:feast).permit(:title, :description, :meal_type, :guest_limit, :price, :address, :start_at, :end_at, :photo)

  end
end
