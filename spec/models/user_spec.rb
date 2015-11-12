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

  describe 'scopes' do
    let (:store_owner_1) { FactoryGirl.create(:user, store_owner: true) }
    let (:store_owner_2) { FactoryGirl.create(:user, store_owner: true) }
    let (:customer_1) { FactoryGirl.create(:user) }
    let (:customer_2) { FactoryGirl.create(:user) }

    it '#store_owners' do
      expect(User.store_owners).to include store_owner_1, store_owner_2
      expect(User.store_owners).to_not include customer_1, customer_2
    end

    it '#customers' do
      expect(User.customers).to include customer_1, customer_2
      expect(User.customers).to_not include store_owner_1, store_owner_2
    end
  end

end
