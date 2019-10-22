class User < ApplicationRecord
  has_many :posts, :dependent => :destroy #A user shouldent be able to be deleted, but this is still probably a good idea
  has_many :pages, :dependent => :destroy
  validates :username, presence: true, uniqueness: true, length: {minimum: 3}
  has_secure_password
end
