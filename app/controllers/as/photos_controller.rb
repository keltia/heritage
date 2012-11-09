class As::PhotosController < AsController
  active_scaffold :photo do |config|
    config.columns.exclude :is_private, :position, :height, :width, :updated_at, :user
    config.list.sorting = { :id => :desc }
    config.list.per_page = 50
  end
end 
