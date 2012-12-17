class PhotosController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :find_story, :except => [:show]
  before_filter :find_or_build_photo, :except => [:show]

  def edit
    respond_to do |format|
      format.js do
        render :text => render_to_string(:partial => 'photos/form', :locals => {:photo => @photo})
      end
    end
  end

  def update
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Photo was saved"
      redirect_to :action => 'show'
    else
      flash.now[:alert] = "Can't save the photo" 
      render :action => 'edit'
    end
  end

  def create
    respond_to do |format|
      unless @photo.save
        flash[:error] = 'Photo could not be uploaded'
      end
      format.js do
        render :text => render_to_string(:partial => 'photos/photo', :locals => {:photo => @photo})
      end
    end
  end

  def destroy
    respond_to do |format|
      unless @photo.destroy
        flash[:error] = 'Photo could not be deleted'
      end
      format.js
      format.html {
        redirect_to editlong_story_path(@story)
      }
    end
  end

  def show
    @story = Story.find_by_permalink(params[:story_id])
    @photo = params[:id] ? @story.photos.find_by_permalink(params[:id]) : @story.photos.build(params[:photo])
    render :layout => "story"
  end

  private

  def find_story
    @story = current_user.stories.find_by_permalink(params[:story_id])
    raise ActiveRecord::RecordNotFound unless @story
  end

  def find_or_build_photo
    @photo = params[:id] ? @story.photos.find_by_permalink(params[:id]) : @story.photos.build(params[:photo])
    @photo.user = current_user if @photo.new_record?

    @photo
  end

end
