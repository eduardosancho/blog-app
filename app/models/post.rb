class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_counter

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
