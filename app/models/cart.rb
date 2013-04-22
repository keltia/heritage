class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  belongs_to :coupon

  def add_photo(photo, size)
    item = cart_items.where(:available_size_id => size.id, :photo_id => photo.id).first ||
      cart_items.create(:available_size_id => size.id, :photo_id => photo.id, :count => 0)
    item.count += 1
    item.save

    item
  end

  def total
    @total ||= cart_items.collect{|item|
      item.available_size.price.to_f * item.count
    }.sum

    @total
  end

  def count
    cart_items.collect(&:count).sum
  end

  include AASM
  aasm do
    state :passive, :initial => true
    state :paid

    event :pay do
      transitions :from => :passive, :to => :paid
    end
  end
end
