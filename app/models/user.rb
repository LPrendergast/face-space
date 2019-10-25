class User < ApplicationRecord
  has_many :posts, :dependent => :destroy #A user shouldent be able to be deleted, but this is still probably a good idea
  has_many :pages, :dependent => :destroy



  has_many :friender_users, foreign_key: :friender_id, class_name: "Friendship"
  has_many :friendees, through: :friender_users

  has_many :friendee_users, foreign_key: :friendee_id, class_name: "Friendship"
  has_many :frienders, through: :friendee_users


  validates :username, presence: true, uniqueness: true, length: {minimum: 3}
  validates :password, presence: true, length: {minimum: 3}

  has_secure_password

  def page_count
    pages.count
  end

  def post_count
    posts.count
  end

  def time_since(time)
    ((Time.current - time)/1.minutes).floor
  end

  def last_page_or_post(type)
    time_since(type.last.created_at)
  end


  def total_views
    pages.sum{|page| page.views}
  end


  def friendships
    friendships = []
    friendee_users.each {|friendee| friendships << friendee}
    friender_users.each {|friender| friendships << friender}
    friendships
  end

  def sent_request
    friendee
  end

  def friends
    friends = []
    friender_users.each do |friendee|
      friendee_users.each do |friender|
        if friender.friender_id == friendee.friendee_id && friender.friendee_id == friendee.friender_id
          friends << User.find(friender.friender_id)
        end
    end
  end

  friends
  end

  def recieved_request
    frienders
  end

  def messages(friend)
    messages = []
    find_friendships(friend).each {|friendship| friendship.messages.each {|message| messages << message}}
    messages.sort_by{|message| message.format_time_for_sort}.last(8)
  end



  def find_friendships(friend)
    get_friendship(User.get_friend(friend))
  end

  def self.get_friend(friend)
    self.find(friend)
  end

  def get_friendship(friend)
    friendships = []
    friendships << Friendship.find{|friendship| friendship.friender_id == self.id && friendship.friendee_id == friend.id }
    friendships << Friendship.find{|friendship| friendship.friendee_id == self.id && friendship.friender_id == friend.id }
    friendships
  end

  def friend?(current_user)
    frienders.include?(current_user)
  end

  def friend_count
    friends.count
  end

  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # Now you can access user's private data, create playlists and much more

    # Access private data
    spotify_user.country #=> "US"
    spotify_user.email   #=> "example@email.com"

    # Create playlist in user's Spotify account
    playlist = spotify_user.create_playlist!('my-awesome-playlist')

    # Add tracks to a playlist in user's Spotify account
    tracks = RSpotify::Track.search('Know')
    playlist.add_tracks!(tracks)
    playlist.tracks.first.name #=> "Somebody That I Used To Know"

    # Access and modify user's music library
    spotify_user.save_tracks!(tracks)
    spotify_user.saved_tracks.size #=> 20
    spotify_user.remove_tracks!(tracks)

    albums = RSpotify::Album.search('launeddas')
    spotify_user.save_albums!(albums)
    spotify_user.saved_albums.size #=> 10
    spotify_user.remove_albums!(albums)

    # Use Spotify Follow features
    spotify_user.follow(playlist)
    spotify_user.follows?(artists)
    spotify_user.unfollow(users)

    # Get user's top played artists and tracks
    spotify_user.top_artists #=> (Artist array)
    spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)

    # Check doc for more
  end


end
