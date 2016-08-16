class Offer < ApplicationRecord
  has_many :meetings
  has_many :availabilities
  belongs_to :user
  belongs_to :category
end
