require 'spec_helper'

describe "as/users/new" do
  before(:each) do
    assign(:as_user, stub_model(User).as_new_record)
  end

  it "renders new as_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => as_users_path, :method => "post" do
    end
  end
end
