module Announcements
  class AddCode
    def initialize(options = {})
      @announcement = options[:announcement]
    end

    def execute
      @announcement.code = Time.now.strftime("%Y%m%d_%H%M%S")
    end
  end
end