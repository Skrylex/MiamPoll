class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :trackable

  validates :pseudo, presence: true, length: {minimum: 3, maximum: 15}, on: [:create, :update]
  validates_uniqueness_of :pseudo

  def remember_me
    (super == nil) ? true : super
  end  

end
