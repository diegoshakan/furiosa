require 'rails_helper'

RSpec.describe Announcement, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
    it { should have_many_attached(:images) }
  end
end
