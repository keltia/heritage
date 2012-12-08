class User < ActiveRecord::Base
  has_many :stories, :order => "position", :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :emails

  has_permalink

  def to_label
    self.email
  end

  def title
    self.name
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
    :name, :description, :facebook_url, :specific_url, :twitter_url
end
