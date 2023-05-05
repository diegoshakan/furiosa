module Announcements
  class VerifyAddress
    def self.call(user)
      !user.address.present?
    end
  end
end