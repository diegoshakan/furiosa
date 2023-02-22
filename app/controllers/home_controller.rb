class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @announcements = Announcement.all_announcements
  end

  def show
    @announcement = Announcement.includes({ images_attachments: :blob }).find(params[:id])
  end
end
