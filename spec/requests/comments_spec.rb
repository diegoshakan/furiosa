require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:announcement) { create(:announcement, user: user, category: category) }

  let(:valid_attributes) { attributes_for(:comment, announcement: announcement) }
  let(:invalid_attributes) { attributes_for(:announcement, content: nil, announcement: announcement) }

  before do
    sign_in user
  end

  describe "POST /announcements/:announcement_id/comments" do
    context "with valid parameters" do
      it "creates a new Comment" do
        expect {
          post announcement_comments_path(announcement), params: { comment: valid_attributes }
        }.to change(Comment, :count).by(1)
      end

      it "renders a successful response" do
        post announcement_comments_path(announcement), params: { comment: valid_attributes }

        expect(response).to redirect_to(pages_show_path(announcement))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Comment" do
        expect {
          post announcement_comments_path(announcement), params: { comment: invalid_attributes }
        }.to change(Comment, :count).by(0)
      end

      it "renders a failed response (i.e. to display the 'new' template)" do
        post announcement_comments_path(announcement), params: { comment: invalid_attributes }

        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /announcements/:announcement_id/comments:id" do
    it "destroy the requested comment" do
      comment = announcement.comments.create! valid_attributes

      expect {
        delete announcement_comment_path(announcement, comment)
      }.to change(Comment, :count).by(-1)
    end

    it "redirect to the announcements list" do
      comment = announcement.comments.create! valid_attributes
      delete announcement_comment_path(announcement, comment)
      expect(response).to redirect_to(pages_show_path(announcement))
    end
  end
end
