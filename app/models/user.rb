class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :topics, dependent: :destroy
  has_many :bookmarks
  has_many :likes, dependent: :destroy
  has_many :liked_bookmarks, through: :likes, source: :bookmark
  
#   after_initialize :set_defaults

  def set_defaults
    self.name = "Testing"
  end
  
  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
  
end
