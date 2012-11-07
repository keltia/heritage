module As::StoriesHelper
  def story_photos_column(record, column)
    result = ""
    record.photos.each do |photo|
      result << image_tag(photo.image_url(:thumb), :width => 30, :height => 30)
    end
    result.html_safe
  end
end
