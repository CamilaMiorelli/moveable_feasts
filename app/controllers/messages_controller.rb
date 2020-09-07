class MessagesController < ApplicationController
    def create
        @chatroom = Chatroom.find_by(feast_id: params[:feast_id])
        @message = Message.new(strong_messages_params)
        @message.chatroom = @chatroom
        @message.user = current_user
        if @message.save
            ChatroomChannel.broadcast_to(
                @chatroom,
                render_to_string(partial: "chatrooms/message", locals: { message: @message })
            )
        #   redirect_to feast_chatroom_path(@chatroom.feast_id, anchor: "message-#{@message.id}")
        else
          render "chatrooms/show"
        end
    end
    
    # def new
    #     @message = Message.new
    #   end

    private
    
    def strong_messages_params
        params.require(:message).permit(:content)
    end
end 