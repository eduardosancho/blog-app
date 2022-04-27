require 'test_helper'

class RoutesTest < ActionController::TestCase
  test 'route test users#index' do
    assert_generates '/users', controller: 'users', action: 'index'
  end

  test 'route test users#show' do
    assert_generates '/users/1', { controller: 'users', action: 'show', id: '1' }
  end
end
