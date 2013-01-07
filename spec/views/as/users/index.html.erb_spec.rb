require 'spec_helper'

describe "as/users/index" do
  before(:each) do
    assign(:as_users, [
      stub_model(User),
      stub_model(User)
    ])
  end

  it "renders a list of as/users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
