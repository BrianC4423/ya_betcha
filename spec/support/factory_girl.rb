require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
  factory :wager do
    sequence(:name) { |n| "wager #{n}" }
  end
  factory :bet do
    sequence(:sender_id) { |n| n }
    sequence(:receiver_id) { |n| n }
    title "Test Bet"
    body "Body of test bet"
    wager
    accepted? true
  end
end
