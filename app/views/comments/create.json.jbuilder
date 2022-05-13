json.comment do |json|
  json.partial! 'comments/comment', comment: Comment.last
end
