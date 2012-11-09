class As::StoriesController < AsController
  active_scaffold :story do |config|
    config.columns.exclude :is_private, :position
    config.list.sorting = { :id => :desc }
  end
end 
