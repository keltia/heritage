class Email < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates_uniqueness_of :email, :scope => :user_id

  attr_accessible :email, :name
end
