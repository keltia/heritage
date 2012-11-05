require 'spec_helper'

describe "as/stories/edit" do
  before(:each) do
    @as_story = assign(:as_story, stub_model(As::Story))
  end

  it "renders the edit as_story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => as_stories_path(@as_story), :method => "post" do
    end
  end
end
