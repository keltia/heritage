require 'spec_helper'

describe "as/photos/show" do
  before(:each) do
    @as_photo = assign(:as_photo, stub_model(As::Photo))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
