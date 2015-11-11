require 'rails_helper'

RSpec.describe Product, type: :model do

  subject { FactoryGirl.create(:product) }

  describe 'fixtures' do
    it "has a valid factory" do
      expect(subject).to be_valid
    end
  end

end
