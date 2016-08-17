class Offer < ApplicationRecord
  has_many :meetings
  has_many :availabilities
  belongs_to :user
  belongs_to :category
  geocoded_by :city
  after_validation :geocode, if: :city_changed?
  mount_uploader :photo, PhotoUploader

end
