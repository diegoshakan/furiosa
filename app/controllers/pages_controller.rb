class PagesController < ApplicationController
  def home
    @announcements = Announcement.all
  end

  def show
    @announcement = Announcement.find(params[:id])
  end
end
