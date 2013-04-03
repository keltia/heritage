class AvailableSize < ActiveRecord::Base
  attr_accessible :price, :shipping_price, :size, :description
  belongs_to :user
end
