class Offer < ApplicationRecord
  has_many :meetings
  has_many :availabilities
  belongs_to :user
  belongs_to :category
  geocoded_by :city
  after_validation :geocode, if: :address_changed?
end
