require 'rails_helper'

RSpec.describe Picture, type: :model do

  subject { FactoryGirl.create(:picture) }

  describe 'attributes' do
    it { is_expected.to have_db_column(:image_file_name).of_type(:string) }
    it { is_expected.to have_db_column(:image_content_type).of_type(:string) }
    it { is_expected.to have_db_column(:image_file_size).of_type(:integer) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:image) }
  end

  describe 'fixtures' do
    it "has a valid factory" do
      expect(subject).to be_valid
    end
  end

end
