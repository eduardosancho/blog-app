module UsersHelper
  def posts?(user)
    out = ''
    out << '<p>This user has no posts</p>' if user.posts.empty?
    out.html_safe
  end
end
