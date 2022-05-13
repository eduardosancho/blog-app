json.post do |json|
  json.partial! 'posts/post', post: @user
end

# json.user do |json|
#   json.partial! 'users/user', user: @user
# end