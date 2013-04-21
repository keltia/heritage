class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :available_size
  belongs_to :photo
  attr_accessible :available_size_id, :photo_id, :count
end
