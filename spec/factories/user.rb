FactoryGirl.define do
  factory :user do
    account
    profile
    name { Faker::Internet.user_name }
  end
end
