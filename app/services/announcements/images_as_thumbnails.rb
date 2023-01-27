module Announcements
  class ImagesAsThumbnails
    def initialize(options = {})
      @announcement = options[:announcement]
    end

    def execute
      @announcement.images.map do |image|
        image.variant(resize_to_limit: [300, 300]).processed
      end
    end
  end
end
