require 'spec_helper'

describe "as/stories/new" do
  before(:each) do
    assign(:as_story, stub_model(As::Story).as_new_record)
  end

  it "renders new as_story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => as_stories_path, :method => "post" do
    end
  end
end
