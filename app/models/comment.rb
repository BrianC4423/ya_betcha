class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :bet

  validates :body, presence: true
  validates :user, presence: true
  validates :bet, presence: true
  paginates_per 5

end
