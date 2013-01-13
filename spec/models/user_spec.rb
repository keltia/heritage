require 'spec_helper'

describe User do
  let(:new_user){FactoryGirl.create(:user, :name => nil)}

  it "should have nil permalinks" do
    new_user.permalink.should be_nil
  end

  it "should update user with permalink" do
    new_user.update_attribute(:name, Faker::Name.name)
    new_user.permalink.should_not be_nil
  end

  it "should create user with permalink" do
    new_user = FactoryGirl.create(:user)
    new_user.permalink.should_not be_nil
  end

  it "should create user with internal urls" do
    new_user.internal_url.should_not be_nil
  end

  # Because we use name for links in account/stories
  it "should create user with names" do
  end

  it "should send a welcome once confirmed" do
    expect{
      user = FactoryGirl.create(:user, :name => nil)
      user.confirm!
    }.to change{ActionMailer::Base.deliveries.count}.by(2)
  end
end
