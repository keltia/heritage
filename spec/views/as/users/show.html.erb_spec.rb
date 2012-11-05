require 'spec_helper'

describe "as/users/show" do
  before(:each) do
    @as_user = assign(:as_user, stub_model(As::User))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
