require 'rails_helper'

RSpec.describe Subcategory, type: :model do
  context 'associations' do
    it { should belong_to(:category) }
  end
end
