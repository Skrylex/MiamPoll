class Vote < ApplicationRecord
  belongs_to :account
  belongs_to :poll
end
