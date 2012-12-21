require 'spec_helper'

describe Story do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @new_story = FactoryGirl.create(:story, :user => @user)
  end

#  it "should create photo with permalink" do
#    @new_story.permalink.should_not be_blank
#  end
#
#  it "should create photo with permalink even if title is empty" do
#    new_story = FactoryGirl.create(:story, :user => @user, :title => nil)
#    new_story.permalink.should_not be_blank
#  end
#
#  it "should update the permalink" do
#    new_story = FactoryGirl.create(:story, :user => @user, :title => nil)
#    new_story.update_attribute(:title, "this is a title")
#    debugger
#    new_story.permalink.should == "this-is-a-title"
#  end
end
