class PhotosController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_story
  before_filter :find_or_build_photo

  def create
    logger.info "User: #{current_user}"

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
    @story = current_user.stories.find(params[:story_id])
    raise ActiveRecord::RecordNotFound unless @story
  end

  def find_or_build_photo
    @photo = params[:id] ? @story.photos.find(params[:id]) : @story.photos.build(params[:photo])
  end

end
