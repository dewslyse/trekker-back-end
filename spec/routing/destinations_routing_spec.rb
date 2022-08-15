require "rails_helper"

RSpec.describe DestinationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/destinations").to route_to("destinations#index")
    end

    it "routes to #show" do
      expect(get: "/destinations/1").to route_to("destinations#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/destinations").to route_to("destinations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/destinations/1").to route_to("destinations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/destinations/1").to route_to("destinations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/destinations/1").to route_to("destinations#destroy", id: "1")
    end
  end
end
