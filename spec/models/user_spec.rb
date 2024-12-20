require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_one(:address) }
    it { should have_many(:announcements) }
  end
end
