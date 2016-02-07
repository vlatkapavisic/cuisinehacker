module ApplicationHelper
  def pagetitle
    content_for?(:title) ? "#{blog_name} &bullet; #{content_for(:title)}".html_safe : blog_name
  end

  def blog_name
    'Cuisine Hacker'
  end
end
