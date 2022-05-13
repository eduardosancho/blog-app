# spec/integration/blogs_spec.rb
require 'swagger_helper'

describe 'Blogs API' do

  path '/api/v1/users' do

    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string },
        },
        required: [ 'email', 'password' ]
      }

      response '200', 'user created' do
        let(:blog) { { email: 'foo', schema: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { email: 'foo' } }
        run_test!
      end
    end
  end
  # Here

  
end