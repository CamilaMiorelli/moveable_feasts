class ReservationsController < ApplicationController
  def new
    @feast = Feast.find(params[:feast_id])
    @reservation = Reservation.new
  end

  def show
    @feast = Feast.find(params[:feast_id])
    @reservation = Reservation.find(params[:id])
    @reservation = current_user.reservations.find(params[:id])
  end

  def create
    @feast = Feast.find(params[:feast_id])
    if @feast.reservations.to_a.sum(&:number_of_guests) + params[:reservation][:number_of_guests].to_i < @feast.guest_limit
      @reservation = Reservation.new(reservation_params)
      @reservation.feast = @feast
      @reservation.user = current_user
      @reservation.amount = @feast.price_cents * params[:reservation][:number_of_guests].to_i
      @reservation.state = "Pending"
      @reservation.save

      #  session = Stripe::Checkout::Session.create(
      #     payment_method_types: ['card'],
      #     line_items: [{
      #       name: @feast.title,
      #       amount: @feast.price_cents * params[:reservation][:number_of_guests].to_i,
      #       currency: 'eur',
      #       quantity: 1
      #     }],
      #     success_url: root_url,
      #     cancel_url: root_url
      #   )
      #  @reservation.update(checkout_session_id: session.id)
      #  flash.notice = "Worked"
      #  redirect_to new_feast_reservation_payment_path(@feast, @reservation)

      if @reservation.save
        redirect_to feast_path(@feast, @reservation)
        flash.notice = "Your reservation has been sent to the host."
      else
        render "feasts/show"
        flash.notice = "Your reservation did not save."
      end
    else
      render "feasts/show"
      flash.notice = "The feast is full"
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
