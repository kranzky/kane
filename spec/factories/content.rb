FactoryGirl.define do
  factory :content do
    source
    url { Faker::Internet.url }
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    body { Faker::Hipster.paragraph(3) }
    thumbnail { Faker::Company.logo }
    published_at { Faker::Date.between(1.year.ago, Date.today) }
  end
end
