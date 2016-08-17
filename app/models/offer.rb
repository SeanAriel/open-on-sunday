class Offer < ApplicationRecord
  has_many :meetings
  has_many :availabilities
  belongs_to :user
  belongs_to :category
  geocoded_by :city
  after_validation :geocode, if: :address_changed?
  mount_uploader :photo, PhotoUploader

  def address_changed?
    false  #george zal dit wel geregeld hebben, zeker? Dit hadden we even nodig om voort the kunnen werken
  end
end
