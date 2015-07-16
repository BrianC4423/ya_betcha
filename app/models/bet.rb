class Bet < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :wager

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :wager_id, presence: true

def self.pending?
  !self.accepted && !self.declined
end
end
