class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_counter

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  def liked?(user)
    @likes = Post.find(id).likes
    @likes.select { |like| like.author_id == user.id }
    return true unless @likes.length.zero?

    false
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
