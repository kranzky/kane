FactoryGirl.define do
  factory :statistic do
    user
    post
    reaction { Faker::SlackEmoji.emoji }
  end
end
