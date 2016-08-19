class Meeting < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :offer
  belongs_to :availability
end
