module Announcements::Helpers
  extend ActiveSupport::Concern

  def create_code
    self.code = DateTime.now.strftime("%Y%m%d%H%M%S%L")
  end
end