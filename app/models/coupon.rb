class Coupon < ActiveRecord::Base
  belongs_to :user
  has_many :carts

  attr_accessible :description, :expires_at, :max_number, :num_available, :purcent_reduction, :number_reduction

  validates_inclusion_of :purcent_reduction, :in => 1..100, :allow_nil => true
  validates_inclusion_of :number_reduction, :in => 1..10000, :allow_nil => true
  validates_numericality_of :num_available, :only_integer => true,
    :greater_than => 0, :allow_nil => true

  before_save do
    self.coupon ||= SecureRandom.hex(8).upcase
  end

  def apply(cart, total)
    result = total
    if purcent_reduction
      result -= (total * purcent_reduction) / 100
    end

    result
  end

  def apply_item(cart_item, price)
    result = price
    if purcent_reduction
      result -= (price * purcent_reduction) / 100
    end

    result
  end
end
