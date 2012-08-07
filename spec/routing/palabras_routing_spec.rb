require "spec_helper"

describe PalabrasController do
  describe "routing" do

    it "routes to #index" do
      get("/palabras").should route_to("palabras#index")
    end

    it "routes to #new" do
      get("/palabras/new").should route_to("palabras#new")
    end

    it "routes to #show" do
      get("/palabras/1").should route_to("palabras#show", :id => "1")
    end

    it "routes to #edit" do
      get("/palabras/1/edit").should route_to("palabras#edit", :id => "1")
    end

    it "routes to #create" do
      post("/palabras").should route_to("palabras#create")
    end

    it "routes to #update" do
      put("/palabras/1").should route_to("palabras#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/palabras/1").should route_to("palabras#destroy", :id => "1")
    end

  end
end
