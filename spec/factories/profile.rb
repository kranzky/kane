FactoryGirl.define do
  factory :profile do
    user
    name { Faker::Name.name }
  end
end
