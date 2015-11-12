FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'password'
    store_owner false
    
  end

end
