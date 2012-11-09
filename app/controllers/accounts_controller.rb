class AccountsController < ApplicationController
  layout "adminfixed"
  before_filter :authenticate_user!
  before_filter :get_photographer

  def show
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
  end

  def social_medias
  end

  def website
  end

  protected

  def get_photographer
    @photographer = current_user
    @stories = current_user.stories
  end
end
