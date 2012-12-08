class StoriesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :get_story, :only => [:update, :edit, :destroy, :sort, :editlong, :updatelong]
  before_filter :get_stories, :only => [:edit, :sort, :editlong, :new, :updatelong]

  def index
    @stories = Story.all(:order => 'id DESC')
  end

  def show
    @story = Story.find_by_permalink(params[:id], :include => [:photos])
    render :layout => "story"
  end

  def new
    @story = Story.new
    render :layout => "adminfixed"
  end

  def edit
    render :layout => "adminfixed"
  end

  def editlong
    render :layout => "adminfixed"
  end

  def updatelong
    Photo.transaction do 
      @story.photos.each do |photo|
        if !photo.update_attributes(params["photos_#{photo.id}".to_sym])
          logger.info "Can't save #{photo}: #{photo.errors.full_messages.to_sentence}"
        end
      end
    end
    flash[:message] = "Photos have been updated"
    redirect_to :action => :editlong
  end

  def sort
    Photo.transaction do
      @story.photos.each do |photo|
        photo.position = params[:sortable].index(photo.id.to_s)
        photo.save
      end
    end
    render :status => '200', :text => "OK"
  end

  def update
    if @story.update_attributes(params[:story])
      flash[:notice] = "Story was saved"
      redirect_to :action => 'show'
    else
      flash.now[:alert] = "Can't save the story" 
      render :action => 'edit'
    end
  end
  
  def destroy
    @story.destroy
    redirect_to stories_account_path
  end

  def create
    @story = Story.new(params[:story])
    @story.user = current_user
    if @story.save
      redirect_to :action => :edit, :id => @story.id
    else
      render :new
    end
  end

  protected

  def get_story
    @story = current_user.stories.find_by_permalink(params[:id], :include => [:photos])
  end

  def get_stories
    @stories = current_user.stories
  end
end
