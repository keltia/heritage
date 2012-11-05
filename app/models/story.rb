class Story < ActiveRecord::Base
  belongs_to :user
  has_many :photos, :order => "position"

  attr_accessible :title, :description
end
