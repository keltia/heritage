class AccountsController < ApplicationController
  set_tab :account
  layout "adminfixed"
  before_filter :authenticate_user!
  before_filter :get_photographer

  def show
  end

  def stories
    unless current_user.stories.any?
      flash[:notice] = "You should first create a story"
      redirect_to new_story_path
    end
  end

  def update
    if current_user.update_attributes(params[:user])
      flash[:notice] = "Info was saved"
      redirect_to :action => 'edit'
    else
      flash.now[:alert] = "Can't save the story" 
      render :action => 'edit'
    end
  end

  def edit
    @photographer.user_avatar ||= @photographer.build_user_avatar
  end

  def social_medias
  end

  def website
  end

  protected

  def get_photographer
    @photographer = current_user
    get_stories
  end
end
