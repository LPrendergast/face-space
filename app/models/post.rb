class Post < ApplicationRecord
  belongs_to :user
  belongs_to :page
  validates :title, presence: true, length: {minimum: 3}
  validates :content, presence: true, length: {minimum: 3}
  
end
