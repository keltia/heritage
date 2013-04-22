class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :available_size
  belongs_to :photo
  attr_accessible :available_size_id, :photo_id, :count

  def item_price
    result = available_size.price
    if cart.coupon
      result = cart.coupon.apply_item(self, result.to_f)
    end

    result
  end
end
