#require 'app/uploaders/photo_uploader'

class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :story

  acts_as_list :scope => :story
  mount_uploader :image, PhotoUploader
end
