require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/announcements/1/comments").to route_to("comments#create", announcement_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/announcements/1/comments/1").to route_to("comments#update", announcement_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/announcements/1/comments/1").to route_to("comments#update", announcement_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/announcements/1/comments/1").to route_to("comments#destroy", announcement_id: "1", id: "1")
    end
  end
end
