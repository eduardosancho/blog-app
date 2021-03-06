require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Likes Validations' do
    it 'should increase it\'s post likes_counter by 1 uppon creation' do
      user = User.new(name: 'Arthur Morgan', posts_counter: 0)
      user.save

      post = Post.new(title: 'Red Dead', text: 'yehaa', comments_counter: 0, likes_counter: 0, author_id: user.id)
      post.save

      like = Like.new(author_id: user.id, post_id: post.id)
      like.save

      expect(like.post.likes_counter).to eq(1)
    end
  end
end
