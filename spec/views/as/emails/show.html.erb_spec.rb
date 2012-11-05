require 'spec_helper'

describe "as/emails/show" do
  before(:each) do
    @as_email = assign(:as_email, stub_model(As::Email))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
