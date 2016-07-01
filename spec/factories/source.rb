FactoryGirl.define do
  factory :source do
    name { Faker::Company.name }
    url { Faker::Internet.url }
  end
end
