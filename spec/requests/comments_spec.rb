require "rails_helper"

RSpec.describe "/comments", type: :request do
  let(:user) { create(:user) }
  let(:announcement) { create(:announcement) }
  let(:valid_attributes) {
    build(:comment, user: user, announcement: announcement).attributes
  }

  let(:invalid_attributes) {
    attributes_for(:comment, content: nil)
  }

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Comment" do
        expect {
          post announcement_comments_url(announcement), params: { comment: valid_attributes }
        }.to change(Comment, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Comment" do
        expect {
          post announcement_comments_url(announcement), params: { comment: invalid_attributes }
        }.to change(Comment, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post announcement_comments_url(announcement), params: { comment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { content: "Add a hash of attributes valid for your model" }
      }

      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        patch announcement_comment_url(announcement, comment), params: { comment: new_attributes }
        comment.reload
        expect(flash[:notice]).to eq("Comment was successfully updated.")
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        comment = Comment.create! valid_attributes
        patch announcement_comment_url(announcement, comment), params: { comment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete announcement_comment_path(announcement, comment)
      }.to change(Comment, :count).by(-1)
    end
  end
end
