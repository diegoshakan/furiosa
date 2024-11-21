require 'rails_helper'

RSpec.describe Subcategory, type: :model do
  context 'associations' do
    it { should belong_to(:category) }
    it { should have_many(:announcements).through(:category) }
  end
end
