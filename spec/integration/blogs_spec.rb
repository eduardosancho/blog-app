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
          password: { type: :string }
        },
        required: %w[email password]
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

  path '/api/v1/users/:user_id/posts/:id' do
    get 'Retrieves a post' do
      tags 'posts', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string

      response '200', 'post found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string }
               },
               required: %w[title text]

        let(:id) { Post.create(title: 'foo', text: 'bar').id }
        run_test!
      end

      response '404', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end
end
