require "spec_helper"

describe As::StoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/as/stories").should route_to("as/stories#index")
    end

    it "routes to #new" do
      get("/as/stories/new").should route_to("as/stories#new")
    end

    it "routes to #show" do
      get("/as/stories/1").should route_to("as/stories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/as/stories/1/edit").should route_to("as/stories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/as/stories").should route_to("as/stories#create")
    end

    it "routes to #update" do
      put("/as/stories/1").should route_to("as/stories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/as/stories/1").should route_to("as/stories#destroy", :id => "1")
    end

  end
end
