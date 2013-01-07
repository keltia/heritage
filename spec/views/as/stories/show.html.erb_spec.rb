require 'spec_helper'

describe "as/stories/show" do
  before(:each) do
    @as_story = assign(:as_story, stub_model(Story))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
