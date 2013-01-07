require 'spec_helper'

describe "as/users/edit" do
  before(:each) do
    @as_user = assign(:as_user, stub_model(User))
  end

  it "renders the edit as_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => as_users_path(@as_user), :method => "post" do
    end
  end
end
