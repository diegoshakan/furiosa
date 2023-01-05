require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_one_attached(:avatar) }
  end
end
