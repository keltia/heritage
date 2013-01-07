require 'spec_helper'

describe "as/emails/new" do
  before(:each) do
    assign(:as_email, stub_model(Email).as_new_record)
  end

  it "renders new as_email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => as_emails_path, :method => "post" do
    end
  end
end
