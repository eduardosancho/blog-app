class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates_presence_of :text

  after_save :update_comments_counter
  after_destroy :decrement_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def decrement_comments_counter
    post.decrement!(:comments_counter)
  end
end
