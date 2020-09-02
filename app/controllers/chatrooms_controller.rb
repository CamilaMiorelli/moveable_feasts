class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    @chatroom = Chatroom.find_by(feast_id: params[:feast_id])
  end
end
