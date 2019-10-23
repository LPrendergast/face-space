class Friendship < ApplicationRecord
    belongs_to :friender, class_name: "User"
    belongs_to :friendee, class_name: "User"
    has_many :messages, :dependent => :destroy
    validate :is_friend?


    def is_friend?
        friender = User.find(friender_id)
        friendships = friender.friendships
        if friendships.find{|friendship|friendship.friendee_id == friendee_id} 
            errors.add(:friendee_id, "Already friends!")
        end
    end
end
