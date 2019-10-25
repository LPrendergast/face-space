class MessagesController < ApplicationController
    before_action :authorize_user
    def index
        @messages = Message.all
    end

    def create
        
        @message = Message.create(message_params)
        @message.user_id =  current_user.id
        @message.save
        
        redirect_to request.referrer
        end

    private
    def message_params
        params.require(:message).permit(:content, :friendship_id)
    end
end
