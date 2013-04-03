class AccountsController < ApplicationController
  set_tab :account, :except => [:stories]
  set_tab :home, :only => [:stories]
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

  def delete_main_photo
    current_user.remove_main_photo!
    redirect_to website_account_path
  end

  def update_main_photo
    if current_user.update_attributes(params[:user])
      respond_to do |format|
        format.json {
          render :json => {:image_url => current_user.main_photo_url}.to_json
        }
      end
    end
  end
  def update_avatar
    if current_user.update_attributes(params[:user])
      respond_to do |format|
        format.json {
          render :json => {:image_url => current_user.avatar_url}.to_json
        }
      end
    end
  end

  def edit
  end

  def social_medias
  end

  def website
  end

end
