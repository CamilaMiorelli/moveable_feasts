class ReservationsController < ApplicationController
  def new
    @feast = Feast.find(params[:feast_id])
    @reservation = Reservation.new
  end

  def show
    @feast = Feast.find(params[:feast_id])
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @feast = Feast.find(params[:feast_id])
    @reservation.feast = @feast
     if @reservation.save
      redirect_to feast_reservation_path(@feast)
    else
      render :new
    end
  end

private

  def reservation_params
    params.require(:reservation).permit(:status, :number_of_guests)
  end
end
