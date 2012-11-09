require 'spec_helper'

describe StoriesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end

    it "block private stories" do

    end

    it "shows public stories" do

    end

    it "shows private stories" do

    end
  end

end
