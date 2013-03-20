module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def full_image_link(url)
    request.protocol + request.host_with_port + url
  end

  def user_description_text(user)
    return unless user.description

    @markdown.render(user.description)
  end

  def user_avatar(user, size = :thumb)
    if user.avatar?
      user.avatar_url(size)
    else
      user.gravatar_url(:s => 150)
    end
  end
end
