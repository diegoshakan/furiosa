class CommentsController < ApplicationController
  before_action :set_announcement

  def create
    @announcement.comments.create! params.expect(comment: [ :content ])
    redirect_to pages_show_path(@announcement)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to pages_show_path(@announcement)
  end

  private

    def set_announcement
      @announcement = Announcement.find(params[:announcement_id])
    end
end
