class CommentsController < ApplicationController
  before_action :set_announcement, only: %i[ create destroy ]
  before_action :set_comment, only: %i[ update destroy ]

  def create
    @comment = @announcement.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to announcement_url(@announcement), notice: "Comment was successfully created."
    else
      redirect_to announcement_url(@announcement), status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to announcement_url(@announcement), notice: "Comment was successfully updated."
    else
      redirect_to announcement_url(@announcement), status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy!

    redirect_to announcement_url(@announcement), notice: "Comment was successfully destroyed."
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:announcement_id])
  end

  def set_comment
    @comment = @announcement.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :announcement_id)
  end
end
