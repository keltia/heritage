class PhotosController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_story
  before_filter :find_or_build_photo

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
    end
  end

  protected

  private

  def find_story
    @story = current_user.stories.find_by_permalink(params[:story_id])
    raise ActiveRecord::RecordNotFound unless @story
  end

  def find_or_build_photo
    @photo = params[:id] ? @story.photos.find_by_permalink(params[:id]) : @story.photos.build(params[:photo])
  end

end
