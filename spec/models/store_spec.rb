RSpec.describe Store, type: :model do
  let (:store_owner) { FactoryGirl.create(:user, store_owner: true) }
  subject { FactoryGirl.create(:store, user: store_owner) }

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
    it { is_expected.to have_many(:products) }
  end

  describe 'create' do

    let (:customer) { FactoryGirl.create(:user, store_owner: false) }

    it 'can be created by store_owner' do
      expect(
          store_owner.create_store(name: 'TestStore')
      ).to be_valid

    end

    it 'can not be created by customer' do
      expect(
          customer.create_store(name: 'TestStore')
      ).to_not be_valid
    end
  end
end
