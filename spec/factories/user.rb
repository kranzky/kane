FactoryGirl.define do
  factory :user do |user|
    name { Faker::Internet.user_name }
  end
end
