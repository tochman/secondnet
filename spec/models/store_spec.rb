require 'rails_helper'

RSpec.describe Store, type: :model do
  subject { FactoryGirl.create(:store) }

  describe 'Fixtures' do
    it 'should have valid Fixture Factory' do
      expect(subject).to be_valid
    end
  end

  describe 'attributes' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
  end
end
