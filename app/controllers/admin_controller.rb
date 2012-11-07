class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    @stories = current_user.stories
  end
end
