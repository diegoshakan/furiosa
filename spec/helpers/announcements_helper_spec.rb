require 'rails_helper'

RSpec.describe Announcements::Helpers, type: :helper do
  describe "#parse_to_real" do
    it "parse currency to Real" do
      value = 10000
      expect(helper.parse_to_real(value)).to eq("R$ 10.000,00")
    end
  end
end
