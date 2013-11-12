require "spec_helper"

describe AmoebasController do
  describe "routing" do

    it "routes to #index" do
      get("/amoebas").should route_to("amoebas#index")
    end

    it "routes to #new" do
      get("/amoebas/new").should route_to("amoebas#new")
    end

    it "routes to #show" do
      get("/amoebas/1").should route_to("amoebas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/amoebas/1/edit").should route_to("amoebas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/amoebas").should route_to("amoebas#create")
    end

    it "routes to #update" do
      put("/amoebas/1").should route_to("amoebas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/amoebas/1").should route_to("amoebas#destroy", :id => "1")
    end

  end
end
