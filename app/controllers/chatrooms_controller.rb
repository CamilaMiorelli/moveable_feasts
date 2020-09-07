class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    @feast = Feast.find(params[:feast_id])
    @chatroom = @feast.chatroom
  end

  def index
    @chatrooms = Chatroom.all
    @feasts = current_user.feasts
    guest_feasts = []
    current_user.reservations.each do |reservation|
      guest_feasts << reservation.feast
    end
    @all_feasts = @feasts + guest_feasts
  end

  
end
