require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
  factory :wager do
    sequence(:name) { |n| "wager #{n}" }
  end

  factory :bet do
    association :sender, factory: :user
    association :receiver, factory: :user
    title "Test Bet"
    body "Body of test bet"
    wager
    accepted true
  end
end
