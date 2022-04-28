require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    # get(:index)
    before(:example) do
      user_index = rand(1..5)
      get user_posts_path(user_index)
    end
    it 'request is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' view html" do
      expect(response).to render_template(:index)
    end

    it 'response body has expected title text' do
      expect(response.body).to include('Posts Index')
    end
  end

  describe 'GET /show' do
    # get(:show)
    before(:example) do
      user_index = rand(1..5)
      post_index = rand(1..5)
      get user_post_path(user_index, post_index)
    end
    it 'request is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' view html" do
      expect(response).to render_template(:show)
    end

    it 'response body has expected title text' do
      expect(response.body).to include('Post Details')
    end
  end
end
