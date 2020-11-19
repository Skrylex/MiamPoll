class Poll < ApplicationRecord
  belongs_to :account

  has_many :votes, dependent: :destroy

  validates :title, presence: true
  
  validate :check_choices, on: %i[create]

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
    return 0 if self.votes.count.to_f == 0
    (self.count_votes(choice).to_f / self.votes.count.to_f) * 100.0
  end

  private

  def check_choices
    errors.add(:poll, :choices) if self.choices.split(',').length < 2
  end
end
