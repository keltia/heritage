class CouponCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :coupon, :string
  end
end
