class ApplicationController < ActionController::Base
  layout 'fixedlayout'
  protect_from_forgery

  before_filter :set_photographer

  protected
  def set_photographer
    @current_photographer = User.find_by_specific_url(request.server_name, :include => [:stories])
  end
end
