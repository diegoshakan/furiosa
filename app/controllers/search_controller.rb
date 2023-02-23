class SearchController < ApplicationController
  def search
    @results = params[:search].blank? ? Announcement.search("*") : Announcement.search(params[:search])

    render turbo_stream: turbo_stream.update('announcements',
                                             partial: 'home/announcements',
                                             locals: { announcements: @results })
  end
end