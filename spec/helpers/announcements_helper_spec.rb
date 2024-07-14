require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AnnouncementsHelper. For example:
#
# describe AnnouncementsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AnnouncementsHelper, type: :helper do
  describe "#parse_to_real" do
    it "parse currency to Real" do
      value = 10000
      expect(helper.parse_to_real(value)).to eq("R$ 10.000,00")
    end
  end
end
