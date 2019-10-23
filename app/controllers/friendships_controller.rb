class FriendshipsController < ApplicationController


    def create
        @friendship = Friendship.create(friendship_params)
        if @friendship.valid?
            redirect_to users_path
        else
            #flashy boy
            redirect_to request.referrer
        end
    end

    def destroy
        friendship = Friendship.find(params[:id])
     
        friendships = friendship.friendee.get_friendship(friendship.friender)
        friendships.each {|friendship| friendship.destroy}
        redirect_to users_path
    end

    private
    def friendship_params
        params.require(:user).permit(:friendee_id, :friender_id)
        
    end
end
