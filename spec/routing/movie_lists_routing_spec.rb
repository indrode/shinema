require "spec_helper"

describe MovieListsController do
  describe "routing" do

    it "routes to #index" do
      get("/movie_lists").should route_to("movie_lists#index")
    end

    it "routes to #new" do
      get("/movie_lists/new").should route_to("movie_lists#new")
    end

    it "routes to #show" do
      get("/movie_lists/1").should route_to("movie_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/movie_lists/1/edit").should route_to("movie_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/movie_lists").should route_to("movie_lists#create")
    end

    it "routes to #update" do
      put("/movie_lists/1").should route_to("movie_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/movie_lists/1").should route_to("movie_lists#destroy", :id => "1")
    end

  end
end
