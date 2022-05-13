json.user do |json|
  json.partial! 'comments/comment', user: current_user
end
