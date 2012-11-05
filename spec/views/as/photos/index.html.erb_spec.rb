require 'spec_helper'

describe "as/photos/index" do
  before(:each) do
    assign(:as_photos, [
      stub_model(As::Photo),
      stub_model(As::Photo)
    ])
  end

  it "renders a list of as/photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
