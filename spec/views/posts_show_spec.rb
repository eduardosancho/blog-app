require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'show page' do
    before(:each) do
      @user_one = User.create! name: 'eduardo', email: 'edu@gmail.com', password: '123456', confirmed_at: Time.now
      @first_post = Post.create! author_id: @user_one.id, title: 'First Post', text: 'Hello'
      @first_comment = Comment.create!(post_id: @first_post.id, author_id: @user_one.id, text: 'First comment')
      @first_like = Like.create!(post_id: @first_post.id, author_id: @user_one.id)
      @second_like = Like.create!(post_id: @first_post.id, author_id: @user_one.id)
      visit new_user_session_path
      page.fill_in 'Email', with: 'edu@gmail.com'
      page.fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_on(@user_one.name)
      click_on('See all posts')
      click_on(@first_post.title)
    end

    it 'I can see the post\'s title.' do
      expect(page).to have_content(@first_post.title)
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_content(@first_post.author.name)
    end

    it 'I can see how many comments it has.' do
      expect(page).to have_content('Comments: 1')
    end

    it 'I can see how many likes it has.' do
      expect(page).to have_content('Likes: 2')
    end

    it 'I can see the post body.' do
      expect(page).to have_content(@first_post.text)
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content(@first_comment.author.name)
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content(@first_comment.text)
    end
  end
end
