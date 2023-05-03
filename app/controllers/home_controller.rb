class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @q = Announcement.all_announcements.ransack(params[:q])
    @announcements = @q.result(distinct: true)
    # @announcements = Announcement.all_announcements
  end

  def show
    @announcement = Announcement.includes({ images_attachments: :blob }).find(params[:id])
    @comments = @announcement.all_comments_in_order_desc
  end
end
