require 'spec_helper'

describe "As::Users" do
  describe "GET /as_users" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "works! (now write some real specs)" do
      visit "/users/sign_in"

      fill_in "Email",    :with => @user.email
      fill_in "Password", :with => "password"

      click_button "Sign in"

      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get as_users_path
      response.status.should be(200)
    end
  end
end
