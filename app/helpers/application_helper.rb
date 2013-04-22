require 'addressable/uri'

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

  def paypal_link(photographer, options={})
    uri = Addressable::URI.parse "https://www.paypal.com/cgi-bin/webscr"

    uri.query_values = {
      cmd: '_xclick',
      return: root_url,
      business: photographer.email,
      currency_code: 'EUR'
    }
    uri.query_values.merge!(options)

    uri.to_s
  end

  def photos_size_options(photographer)
    photographer.available_sizes.collect{|size|
      ["#{size.description} (#{size.size}): #{size.price} EUR", size.id]
    }
  end

  def paypal_button_items
    i = 1
    result = ""
    @available_sizes = @photographer.available_sizes.group_by(&:id)
    @cart.cart_items.each do |item|
      photo_description = item.photo.title
      if photo_description.blank?
        photo_description = "Photo #{item.photo.id}"
      end
      photo_description << ": " << item.photo.description
      result << hidden_field_tag("item_name_#{i}", photo_description) << "\n"
      result << hidden_field_tag("item_number_#{i}", item.photo_id) << "\n"
      result << hidden_field_tag("amount_#{i}", item.available_size.price) << "\n"
      result << hidden_field_tag("quantity_#{i}", item.count, id: "paypal_item_cart_#{item.id}") << "\n"
      result << hidden_field_tag("shipping_#{i}", item.available_size.shipping_price) << "\n"
      i+=1
    end

    result.html_safe
  end
end
