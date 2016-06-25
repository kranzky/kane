FactoryGirl.define do
  factory :provider do
    name { Faker::Company.name }
    url { Faker::Internet.url }
  end
end
