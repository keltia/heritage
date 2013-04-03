class AvailableSizesController < ApplicationController
  set_tab :account, :except => [:stories]
  layout "adminfixed"
  before_filter :authenticate_user!
  before_filter :get_photographer

  def index

  end

  def create
    if params[:available_size]
      current_user.available_sizes.create(params[:available_size])
      redirect_to account_available_sizes_path
    end
  end

  def destroy
    current_user.available_sizes.find(params[:id]).destroy
    redirect_to account_available_sizes_path
  end
end
