require 'spec_helper'

describe "as/emails/index" do
  before(:each) do
    assign(:as_emails, [
      stub_model(Email),
      stub_model(Email)
    ])
  end

  it "renders a list of as/emails" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
