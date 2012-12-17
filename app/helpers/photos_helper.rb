module PhotosHelper
  def show_thumbs(story, photo)
    return unless story.photos.any?

    result = ""

    story.photos.each do |p|
      next if p.position < (@photo.position - 2)
      break if p.position > (@photo.position + 2)

      result << content_tag(:li, link_to(image_tag(p.image_url(:thumb)), 
                                story_photo_path(@story, p), 
                                :class => "thumbnail"))
    end

    result.html_safe
  end
end
