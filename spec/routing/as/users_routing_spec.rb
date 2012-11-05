require "spec_helper"

describe As::UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/as/users").should route_to("as/users#index")
    end

    it "routes to #new" do
      get("/as/users/new").should route_to("as/users#new")
    end

    it "routes to #show" do
      get("/as/users/1").should route_to("as/users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/as/users/1/edit").should route_to("as/users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/as/users").should route_to("as/users#create")
    end

    it "routes to #update" do
      put("/as/users/1").should route_to("as/users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/as/users/1").should route_to("as/users#destroy", :id => "1")
    end

  end
end
