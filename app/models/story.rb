class Story < ActiveRecord::Base
  belongs_to :user
  has_many :photos, :order => "position", :dependent => :destroy
  acts_as_list :scope => :user_id

  scope :public, where(is_private: false)
  scope :private, where(is_private: true)

  acts_as_taggable
  has_permalink

  validates_presence_of :user_id, :title
  validates_uniqueness_of :title, :scope => :user_id

  attr_accessible :title, :description, :tag_list, :is_private

  def max_photo_height
    max_height = photos.sort{|a,b| a.height <=> b.height }.last

    max_height.photo_dimension.last
  end

  def max_photo_width
    photos.sort{|a,b| a.width <=> b.width }.last.photo_dimension.first
  end

  before_create :set_private
  def set_private
    self.is_private = true
  end

#  protected
#  before_save :generate_permalinkifblank
#  def generate_permalinkifblank
#    if self.title.blank?
#      self.permalink = self.id.to_s
#    end
#
#    true
#  end
end
