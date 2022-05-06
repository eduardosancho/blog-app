class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  def liked?(user)
    @likes = Post.find(id).likes
    @likes.select { |like| like.author_id == user.id }
    return true unless @likes.length.zero?

    false
  end

  def reduced_text
    return text if text.length < 200

    "#{text[0, 200]}..."
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
