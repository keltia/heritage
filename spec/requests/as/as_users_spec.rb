require 'spec_helper'

describe "As::Users" do
  describe "GET /as_users" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get as_users_path
      response.status.should be(200)
    end
  end
end
