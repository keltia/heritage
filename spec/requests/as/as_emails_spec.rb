require 'spec_helper'

describe "As::Emails" do
  describe "GET /as_emails" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get as_emails_path
      response.status.should be(200)
    end
  end
end
