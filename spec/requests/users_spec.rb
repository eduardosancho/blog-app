require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    # pending "add some examples (or delete) #{__FILE__}"

    before(:example) {get users_path } # get(:index)

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it "render has expected text" do
      expect(response.body).to include('Users Index')
    end

  end
end
