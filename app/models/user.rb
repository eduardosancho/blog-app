class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  # validates_presence_of :name
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false,
                   format: { with: /\A[a-zA-Z0-9]+\z/ }

  def recent_posts
    user = User.includes(:posts, posts: [:comments, { comments: [:author] }]).find(id)
    user.posts.limit(3).order(created_at: :desc)
  end

  def admin?
    role == 'admin'
  end

  def generate_jwt
    JWT.encode({ id: id,
                 exp: 60.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end
end
