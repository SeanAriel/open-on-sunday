class Availability < ApplicationRecord
  belongs_to :offer
  has_many :meetings
end
