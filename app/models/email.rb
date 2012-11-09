class Email < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id

  attr_accessible :email, :name
end
