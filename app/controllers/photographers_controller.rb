class PhotographersController < ApplicationController
  layout 'story'
  before_filter :set_title

  def show
    if params[:id]
      @photographer = User.find_by_permalink(params[:id], :include => [:stories]) ||
        User.find(params[:id], :include => [:stories])
    end
    @photographer ||= @current_photographer

    raise ActiveRecord::RecordNotFound unless @photographer

    @stories = @photographer.stories.public(include: [:photos])
    @stories.each do |story|
      if story.photos.any?
        @front_story = story
        break
      end
    end
  end

  set_tab :contact, only: [:contact]
  set_tab :about, only: [:about]
  set_tab :home, only: [:show]
  def contact
  end

  def about
    @stories = @photographer.stories.public(include: [:photos])
  end

  def index
    @photographers = User.all(:include => [:stories])
  end

  before_filter :authenticate_user!, :only => [:edit, :update, :sort]
  before_filter :get_photographer, :only => [:edit, :update, :sort]
  def edit
    render :layout => "adminfixed"
  end

  def update
    if @photographer.update_attributes(params[:user])
      flash[:notice] = "Info was saved"
      redirect_to :action => 'edit'
    else
      flash.now[:alert] = "Can't save the story"
      render :action => 'edit'
    end
  end

  def sort
    Story.transaction do
      current_user.stories.each do |story|
        story.position = params[:sortable].index(story.id.to_s)
        story.save
      end
    end
    render :text => "OK"
  end

  protected

  def get_photographer
    @photographer = current_user
  end
end
