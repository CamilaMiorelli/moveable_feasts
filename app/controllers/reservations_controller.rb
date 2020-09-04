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
    @feast = Feast.find(params[:feast_id])
    if @feast.reservations.to_a.sum(&:number_of_guests) < @feast.guest_limit
      @reservation = Reservation.new(reservation_params)
      @reservation.feast = @feast
      @reservation.user = current_user
      if @reservation.save
        redirect_to feast_path(@feast, @reservation)
        flash.notice = "Your reservation has been sent to the host."
      else
        render :new
        flash.alert = "Your reservation did not save."
      end
    else
      render :new
      flash.alert = "The feast is full"
    end
  end

  def bookings
    @reservations = current_user.reservations
  end

  def incoming_bookings
    @reservations = current_user.incoming_reservations
    render :bookings
  end

  def accept
    @reservation = Reservation.find(params[:id])
    @reservation.status = "Accepted"
    @reservation.save
    redirect_to feast_path(@reservation.feast, @reservation)
  end

  def decline
    @reservation = Reservation.find(params[:id])
    @reservation.status = "Declined"
    @reservation.save
    redirect_to feast_path(@reservation.feast, @reservation)
  end

  # def available?
  #   status !== "accepted"
  #   # return true
  # end

private

  def reservation_params
    params.require(:reservation).permit(:status, :number_of_guests, :comment)
  end
end
