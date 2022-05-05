module PostsHelper
  def has_comments?(post)
    out = ''
    if post.comments_counter.nil?
      out << '<p>This post has no comments</p>'
    end
    out.html_safe
  end
end
