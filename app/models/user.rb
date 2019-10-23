class User < ApplicationRecord
  has_many :posts, :dependent => :destroy #A user shouldent be able to be deleted, but this is still probably a good idea
  has_many :pages, :dependent => :destroy



  has_many :friender_users, foreign_key: :friender_id, class_name: "Friendship"
  has_many :friendees, through: :friender_users

  has_many :friendee_users, foreign_key: :friendee_id, class_name: "Friendship"
  has_many :frienders, through: :friendee_users


  validates :username, presence: true, uniqueness: true, length: {minimum: 3}
  has_secure_password

  def get_pages
    Pages.find_by(user: self)
  end


  def friendships
    friendships = []
    friendee_users.each {|friendee| friendships << friendee}
    friender_users.each {|friender| friendships << friender}
    friendships
  end

  def messages
    friendships.map {|friendship| friendship.messages}
  end

  def friend?(current_user)
    frienders.include?(current_user)
  end

  

end
