module UsersHelper
  def has_posts?(user)
    out = ''
    if user.posts.length < 1
      out << '<p>This user has no posts</p>'
    end
    out.html_safe
  end
end
