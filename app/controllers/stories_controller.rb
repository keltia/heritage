class StoriesController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :sort]

  def index
    @stories = Story.all(:order => 'id DESC')
  end

  def show
    @story = Story.find(params[:id], :include => [:photos])

    render :layout => "story"
  end

  def new
    @story = Story.new
    @stories = current_user.stories
    render :layout => "adminfixed"
  end

  def edit
    @story = current_user.stories.find(params[:id])
    @stories = current_user.stories
    render :layout => "adminfixed"
  end

  def sort
    @story = current_user.stories.find(params[:id], :include => [:photos])

    Photo.transaction do
      @story.photos.each do |photo|
        photo.position = params[:sortable].index(photo.id.to_s)
        photo.save
      end
    end
    render :status => '200', :text => "OK"
  end

  def update
    @story = current_user.stories.find(params[:id])
    if @story.update_attributes(params[:story])
      flash[:notice] = "Story was saved"
      redirect_to :action => 'show'
    else
      flash.now[:alert] = "Can't save the story" 
      render :action => 'edit'
    end
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
end
