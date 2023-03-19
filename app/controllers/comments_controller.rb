class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_announcement

  def create
    @comment = @announcement.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comentário criado!"
      redirect_to "/view_announcement/#{@announcement.id}"
    else
      flash[:alert] = "Comentário não foi criado!"
      redirect_to "/view_announcement/#{@announcement.id}"
    end
  end

  def destroy
    @comment = @announcement.comments.find(params[:id])
    @comment.destroy
    redirect_to "/view_announcement/#{@announcement.id}"
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:announcement_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
