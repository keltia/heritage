class User < ActiveRecord::Base
  has_many :stories, :order => "position", :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :emails
  has_one :user_avatar, :dependent => :destroy

  validates_uniqueness_of :specific_url
  validates_uniqueness_of :name, :allow_blank => true, :allow_nil => true

  accepts_nested_attributes_for :user_avatar
  attr_accessible :user_avatar_attributes

  has_permalink

  def any_for_sale?
    self.photos.count(:conditions => {:for_sale => true}) > 0
  end

  def to_label
    self.email
  end

  def gravatar_url(options = {})
    Gravatar.new(email).image_url(options)
  end

  def title
    self.name
  end

  before_create :create_specific_url
  def create_specific_url
    if email =~ /^(.*)@/
      internal_url = "#{$1}.heritage.io"
      specific_url = "#{$1}.heritage.io"
    end
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
    :name, :description, :facebook_url, :specific_url, :twitter_url,
    :blog_url, :user_avatar
end
