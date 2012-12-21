require 'spec_helper'

describe Photo do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @story = FactoryGirl.create(:story, :user => @user)
    @new_photo = FactoryGirl.create(:photo, :user => @user, :story => @story)
  end

  it "should create photo with permalink" do
    @new_photo.permalink.should_not be_blank
  end

  it "should create photo with permalink even if title is empty" do
    new_photo = FactoryGirl.create(:photo, :user => @user, :story => @story, :title => nil)
    new_photo.permalink.should_not be_blank
  end
end
