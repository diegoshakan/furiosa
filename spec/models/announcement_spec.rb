require 'rails_helper'

RSpec.describe Announcement, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category).optional }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many_attached(:images) }
  end

  context 'validations' do
    it { should validate_presence_of(:title) }
  end
end
