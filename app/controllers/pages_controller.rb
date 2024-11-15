class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_announcement, only: [ :show ]

  def home
    @announcements = Announcement.all.order(created_at: :desc)
  end

  def show; end

  private

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end
end
