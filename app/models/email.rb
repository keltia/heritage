class Email < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  attr_accessible :email, :name
end
