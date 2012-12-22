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

  def user_avatar_url(user)
    if user.user_avatar && !user.user_avatar.new_record?
      user.user_avatar.image_url(:thumb)
    else
      user.gravatar_url(:s => 150)
    end
  end
end
