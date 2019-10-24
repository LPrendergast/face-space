class Page < ApplicationRecord
  has_many :posts, :dependent => :destroy
  belongs_to :user
  validates :title, presence: true, uniqueness: true, length: {minimum: 3}
  validates :content, presence: true, length: {minimum: 10}

  def self.total_amount_views
    Page.all.map(&:views).sum
  end
end
