class Bet < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :wager
  
  has_many :comments, dependent: :destroy

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :wager_id, presence: true

  paginates_per 10
end
