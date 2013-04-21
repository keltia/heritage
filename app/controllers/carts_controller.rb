class CartsController < ApplicationController
  set_tab :cart
  before_filter :set_title
  layout 'story'

  def add
    photo_id = params[:photo_id]
    size = params[:size]

    @photo = Photo.find(photo_id)
    @size = AvailableSize.find(params[:size])
    @cart.add_photo(@photo, @size)

    redirect_to :action => :show
  end

  def show
    @available_sizes = @photographer.available_sizes.group_by(&:id)
  end

end
