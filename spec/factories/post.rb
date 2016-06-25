FactoryGirl.define do
  factory :post do
    user
    content
    url { Faker::Internet.url }
  end
end
