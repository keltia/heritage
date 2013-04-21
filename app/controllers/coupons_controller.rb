class CouponsController < ApplicationController
  set_tab :account, :except => [:stories]
  layout "adminfixed"
  before_filter :authenticate_user!
  before_filter :get_photographer
  def create
    if params[:coupon]
      current_user.coupons.create(params[:coupon])
      redirect_to account_available_sizes_path
    end
  end

  def destroy
    current_user.coupons.find(params[:id]).destroy
    redirect_to account_available_sizes_path
  end
end
