class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :trackable

  has_many :polls, dependent: :destroy

  validates :pseudo, presence: true, length: {minimum: 3, maximum: 15}, on: [:create, :update]
  validates_uniqueness_of :pseudo
  
  def remember_me
    (super == nil) ? true : super
  end  

  def open_polls
    self.polls.where('closed_at > ?', Time.now)
  end

  def close_polls
    self.polls.where('closed_at <= ? OR closed_at IS ?', Time.now, nil)
  end  

end
