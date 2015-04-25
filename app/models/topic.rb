class Topic < ActiveRecord::Base
  belongs_to :user
  mas_many :bookmarks
end
