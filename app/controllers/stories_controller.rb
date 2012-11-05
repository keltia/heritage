class StoriesController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params[:story])
    @story.user = current_user
    if @story.save
      redirect_to :action => :show, :id => @story.id
    else
      render :new
    end
  end
end
