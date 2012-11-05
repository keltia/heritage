require 'spec_helper'

describe "as/emails/edit" do
  before(:each) do
    @as_email = assign(:as_email, stub_model(As::Email))
  end

  it "renders the edit as_email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => as_emails_path(@as_email), :method => "post" do
    end
  end
end
