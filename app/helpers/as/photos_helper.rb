module As::PhotosHelper
  def photo_image_column(record, column)
    image_tag(record.image_url(:thumb), :width => 30, :height => 30)
  end
end
