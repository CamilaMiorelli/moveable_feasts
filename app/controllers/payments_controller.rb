class PaymentsController < ApplicationController
  def new
    @reservation = current_user.reservations.where(state: 'Pending').find(params[:reservation_id])
  end
end
