require "spec_helper"

describe As::EmailsController do
  describe "routing" do

    it "routes to #index" do
      get("/as/emails").should route_to("as/emails#index")
    end

    it "routes to #new" do
      get("/as/emails/new").should route_to("as/emails#new")
    end

    it "routes to #show" do
      get("/as/emails/1").should route_to("as/emails#show", :id => "1")
    end

    it "routes to #edit" do
      get("/as/emails/1/edit").should route_to("as/emails#edit", :id => "1")
    end

    it "routes to #create" do
      post("/as/emails").should route_to("as/emails#create")
    end

    it "routes to #update" do
      put("/as/emails/1").should route_to("as/emails#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/as/emails/1").should route_to("as/emails#destroy", :id => "1")
    end

  end
end
