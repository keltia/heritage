class Story < ActiveRecord::Base
  belongs_to :user
  has_many :photos, :order => "position"
  acts_as_list :scope => :user_id

  attr_accessible :title, :description

  def max_photo_height
    max_height = photos.sort{|a,b| a.height <=> b.height }.last

    max_height.photo_dimension.last
  end

  def max_photo_width
    photos.sort{|a,b| a.width <=> b.width }.last.photo_dimension.first
  end
end
