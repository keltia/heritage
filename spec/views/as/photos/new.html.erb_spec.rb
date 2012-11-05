require 'spec_helper'

describe "as/photos/new" do
  before(:each) do
    assign(:as_photo, stub_model(As::Photo).as_new_record)
  end

  it "renders new as_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => as_photos_path, :method => "post" do
    end
  end
end
