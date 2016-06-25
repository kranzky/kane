FactoryGirl.define do
  factory :author do
    name { Faker::Name.name }
    url { Faker::Internet.url }
  end
end
