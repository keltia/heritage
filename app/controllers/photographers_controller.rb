class PhotographersController < ApplicationController

  def show
    @photographer = User.find(params[:id], :include => [:stories])
    @stories = @photographer.stories.all(:include => [:photos])
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
    @photographer = current_user
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
      @photographer.stories.each do |story|
        story.position = params[:sortable].index(story.id.to_s)
        story.save
      end
    end
    render :status => '200', :text => "OK"
  end

  protected

  def get_photographer
    @photographer = current_user
    @stories = current_user.stories
  end
end
