class Meeting < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  belongs_to :offer
  belongs_to :availability
end
