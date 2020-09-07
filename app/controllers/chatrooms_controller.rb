class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    @feast = Feast.find(params[:feast_id])
    @chatroom = @feast.chatroom
  end

  def index
    @chatrooms = Chatroom.all
    @feasts = Feast.all
  end
  
end
