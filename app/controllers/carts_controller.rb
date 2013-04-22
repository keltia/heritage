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

  def update_item
    @cart.cart_items.find(params[:cart_item_id]).update_attribute(:count, params[:value])
    respond_to do |format|
      format.js {
        render :json => {:total => @cart.total}
      }
    end
  end

  def set_coupon
    coupon = Coupon.find_by_coupon(params[:coupon])
    if coupon
      @cart.coupon = coupon
      @cart.save
      respond_to do |format|
        format.js {
          render :json => {:total => @cart.total}
        }
      end
    end
  end
end
