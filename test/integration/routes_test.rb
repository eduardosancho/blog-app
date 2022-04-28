require 'test_helper'

class RoutesTest < ActionController::TestCase
  test 'route test users#index' do
    assert_generates '/users', controller: 'users', action: 'index'
  end

  test 'route test users#show' do
    assert_generates '/users/1', { controller: 'users', action: 'show', id: '1' }
  end

  test 'route test posts#index' do
    assert_generates '/users/1/posts', { controller: 'posts', action: 'index', user_id: '1' }
  end

  test 'route test posts#show' do
    assert_generates '/users/1/posts/1', { controller: 'posts', action: 'show', user_id: '1', id: '1' }
  end
end
