require "spec_helper"

describe SignificadosController do
  describe "routing" do

    it "routes to #index" do
      get("/significados").should route_to("significados#index")
    end

    it "routes to #new" do
      get("/significados/new").should route_to("significados#new")
    end

    it "routes to #show" do
      get("/significados/1").should route_to("significados#show", :id => "1")
    end

    it "routes to #edit" do
      get("/significados/1/edit").should route_to("significados#edit", :id => "1")
    end

    it "routes to #create" do
      post("/significados").should route_to("significados#create")
    end

    it "routes to #update" do
      put("/significados/1").should route_to("significados#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/significados/1").should route_to("significados#destroy", :id => "1")
    end

  end
end
