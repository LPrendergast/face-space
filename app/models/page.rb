class Page < ApplicationRecord
  has_many :posts
  belongs_to :user
end
