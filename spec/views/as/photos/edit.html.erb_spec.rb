require 'spec_helper'

describe "as/photos/edit" do
  before(:each) do
    @as_photo = assign(:as_photo, stub_model(As::Photo))
  end

  it "renders the edit as_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => as_photos_path(@as_photo), :method => "post" do
    end
  end
end
