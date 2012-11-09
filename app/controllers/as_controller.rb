class AsController < ApplicationController
  layout 'active_scaffold'
  before_filter :get_stories
  before_filter :authenticate_user!

  protected
  def get_stories
    @stories = current_user.stories
  end
end

