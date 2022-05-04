class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', :dependent => :destroy
  has_many :comments, foreign_key: 'author_id', :dependent => :destroy
  has_many :likes, foreign_key: 'author_id', :dependent => :destroy

  def recent_posts 
    posts.limit(3).order(created_at: :desc)
  end
end
