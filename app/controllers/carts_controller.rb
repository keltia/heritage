class CartsController < ApplicationController
  set_tab :cart
  before_filter :set_title
  layout 'story'

  def add
    photo_id = params[:photo_id]
    size = params[:size]

    session[:cart] ||= {}
    session[:cart][photo_id] ||= {}
    session[:cart][photo_id][params[:size]] ||= 0
    session[:cart][photo_id][params[:size]] += 1

    redirect_to :action => :show
  end

  def show
    @available_sizes = @photographer.available_sizes.group_by(&:id)
  end

  protected

  def get_cart

  end
end
