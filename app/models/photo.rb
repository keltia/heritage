class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :story

  validates_presence_of :story_id
  validates_presence_of :user_id

  acts_as_taggable
  has_permalink

  attr_accessible :image, :title, :description, :tag_list, :for_sale
  acts_as_list :scope => :story
  mount_uploader :image, PhotoUploader

  RESIZE_TO_FIT = [800, 800]
  def photo_dimension(max=RESIZE_TO_FIT)
    result_height = (RESIZE_TO_FIT.first.to_f / width) * height

    [RESIZE_TO_FIT.first, result_height.to_i]
  end

  def all_tags
    (self.tags + self.story.tags).uniq
  end

  def photo_ratio
    width / height
  end

  def resize_ratio
    RESIZE_TO_FIT.first / RESIZE_TO_FIT.last
  end

  def to_s
    "<Photo:#{self.id}>"
  end

  protected
  before_save :generate_permalinkifblank
  def generate_permalinkifblank
    if self.permalink.blank?
      self.permalink = "#{self.id}"
    end
  end

end
