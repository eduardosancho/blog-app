class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, :dependent => :destroy

  before_save :update_posts_counter

  private
  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
