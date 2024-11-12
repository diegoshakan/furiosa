class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @announcements = Announcement.all.order(created_at: :desc)
  end
end
