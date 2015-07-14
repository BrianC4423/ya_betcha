class Wager < ActiveRecord::Base
  has_many :bets

  validates :name, presence: true
end
