class AvailableSize < ActiveRecord::Base
  attr_accessible :price, :shipping_price, :size, :description, :title
  belongs_to :user
end
