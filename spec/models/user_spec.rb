require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.create(:user) }

  describe 'Fixtures' do
    it 'should have valid Fixture Factory' do
      expect(subject).to be_valid
    end
  end

  describe 'attributes' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_one :store }
    it { is_expected.to have_many(:products).through(:store) }
  end
end
