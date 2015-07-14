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
end
