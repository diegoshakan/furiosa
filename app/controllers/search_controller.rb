class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  def search
    all_results = Announcement.search("*")
    specific_results = Announcement.search(params[:search])

    @results = params[:search].blank? ? all_results : specific_results

    render turbo_stream: turbo_stream.update('announcements',
                                             partial: 'home/announcements',
                                             locals: { announcements: @results })
  end
end