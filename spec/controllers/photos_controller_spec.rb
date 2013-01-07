require 'spec_helper'

describe PhotosController do
  before do
    @user = FactoryGirl.create(:user)
    @story = FactoryGirl.create(:story, :user => @user)
    sign_in @user
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create', :story_id => @story, :format => 'js'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy', :story_id => @story, :format => 'js'
      response.should be_success
    end
  end

end
