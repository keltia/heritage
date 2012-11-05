require "spec_helper"

describe As::PhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/as/photos").should route_to("as/photos#index")
    end

    it "routes to #new" do
      get("/as/photos/new").should route_to("as/photos#new")
    end

    it "routes to #show" do
      get("/as/photos/1").should route_to("as/photos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/as/photos/1/edit").should route_to("as/photos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/as/photos").should route_to("as/photos#create")
    end

    it "routes to #update" do
      put("/as/photos/1").should route_to("as/photos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/as/photos/1").should route_to("as/photos#destroy", :id => "1")
    end

  end
end
