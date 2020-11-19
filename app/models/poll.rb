class Poll < ApplicationRecord
  belongs_to :account

  has_many :votes, dependent: :destroy

  validates :title, presence: true

  def owner?(account)
    account.id == self.account_id
  end

  def open?
    self.closed_at.nil? || self.closed_at.to_i > Time.now.to_i
  end

  def count_votes(choice)
    self.votes.where(gmap_id: choice).length
  end

  def percent_votes(choice)
    (self.count_votes(choice).to_f / self.votes.count.to_f) * 100.0
  end
end
