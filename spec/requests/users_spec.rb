require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before(:example) { get users_path } # get(:index)

    it "request is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' view html" do
      expect(response).to render_template(:index)
    end

    it "response body has expected title text" do
      expect(response.body).to include('Users Index')
    end
  end

  describe "GET /show" do
    before(:example) { 
      user_index = rand(1..5)
      get user_path(user_index) 
    } # get(:show)

    it "request is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' view html" do
      expect(response).to render_template(:show)
    end

    it "response body has expected title text" do
      expect(response.body).to include('User Profile')
    end
  end
end
