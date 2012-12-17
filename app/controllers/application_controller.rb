class ApplicationController < ActionController::Base
  layout :choose_layout
  protect_from_forgery

  before_filter :set_photographer

  protected
  def set_photographer
    @current_photographer = User.find_by_specific_url(request.server_name, :include => [:stories])
  end

  def choose_layout
    "fixedlayout"
    "adminfixed"
  end
end
