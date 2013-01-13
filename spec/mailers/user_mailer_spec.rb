require "spec_helper"

describe UserMailer do
  let(:user) {FactoryGirl.create(:user)}
  it "should send a welcome email" do
    email = UserMailer.welcome_email(user).deliver
    ActionMailer::Base.deliveries.should_not be_empty
    email.to.count.should == 1
    email.to.first.should == user.email
    email.encoded.should =~ /Create a story at/i
    email.encoded.should =~ /#{Settings[:admin_domain]}/i
  end
end
