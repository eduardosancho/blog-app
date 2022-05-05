module PostsHelper
  def comments?(post)
    out = ''
    out << '<p>This post has no comments</p>' if post.comments_counter.nil?
    out.html_safe
  end
end
