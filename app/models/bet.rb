class Bet < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :wager

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :wager_id, presence: true

  scope :accepted, -> boolean { where(accepted: boolean) }
  paginates_per 5

  def score
    vote.sum(:value)
  end

  def set_receiver(email)
    user = User.find_by_email(email)
    if user.present?
      self.receiver = user
    end
  end
end
