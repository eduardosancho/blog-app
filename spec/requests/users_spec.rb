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
end
