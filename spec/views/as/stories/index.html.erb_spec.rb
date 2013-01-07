require 'spec_helper'

describe "as/stories/index" do
  before(:each) do
    assign(:as_stories, [
      stub_model(Story),
      stub_model(Story)
    ])
  end

  it "renders a list of as/stories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
