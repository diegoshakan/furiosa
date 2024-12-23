require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'associations' do
    it { should belong_to(:announcement) }
  end

  context 'validations' do
    it { should validate_presence_of(:content) }
  end
end
