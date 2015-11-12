FactoryGirl.define do
  factory :picture do
    image { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.jpg'), 'image/jpg') }
  end

end
