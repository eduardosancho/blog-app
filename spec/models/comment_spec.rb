require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comments Validations' do
    it 'should increase post\'s comments_counter by 1 upon creation' do
      user = User.new(name: 'Adam Sandler', posts_counter: 0)
      user.save

      post = Post.new(title: 'Good Movie', text: 'yahoo', author_id: user.id, comments_counter: 0, likes_counter: 0)
      post.save

      comment = Comment.new(post_id: post.id, author_id: user.id, text: 'Famous guy')
      comment.save

      expect(comment.post.comments_counter).to eq(1)
    end
  end
end
