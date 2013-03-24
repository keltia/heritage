class ApplicationController < ActionController::Base
  layout :choose_layout
  protect_from_forgery

  before_filter :set_photographer

  protected
  def set_photographer
    if is_admin_interface?
      @current_photographer = @photographer = current_user
    else

      host_for_query = "#{request.server_name}"
      host_for_query = "www.#{host_for_query}" if host_for_query !~ /^www\./

      host_for_query_without_www = "#{request.server_name}"
      host_for_query_without_www.gsub!(/^www\./, '')

      @current_photographer = @photographer = User.first(:conditions => ['specific_url = ? OR specific_url = ?  OR internal_url = ? OR internal_url = ?',
                                                        host_for_query, host_for_query_without_www, host_for_query, host_for_query_without_www],
                                                                        :include => [:stories])

      if @photographer.nil? && request.server_name =~ /heritage\.io$/
        @current_photographer = @photographer = User.find_by_internal_url(request.server_name, 
                                                                          :include => [:stories])
      end

      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                          :autolink => true, 
                                          :space_after_headers => true)

      # use request.host ? raise ActiveRecord::RecordNotFound ?
    end

  end

  def choose_layout
    "fixedlayout"
    "adminfixed"
  end

  def get_story
    story_id = params[:story_id] || params[:id]
    @story = current_user.stories.find_by_permalink(story_id, :include => [:photos]) ||
      current_user.stories.find(story_id, :include => [:photos])

    @title ||= "#{@story.user.name}: #{@story.title}"
    raise ActiveRecord::RecordNotFound unless @story
  end

  def get_stories
    return unless @photographer

    @stories = @photographer.stories
  end

  def is_admin_interface?
    ['admin.minideb.local', 'admin.heritage.io'].include? request.server_name
  end

  def set_title
    @title ||= @photographer.name if @photographer
  end
end
