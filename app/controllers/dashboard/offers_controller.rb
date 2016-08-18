class Dashboard::OffersController < ApplicationController
  def index
    @offers = current_user.offers
    @user = current_user
    @reviews = current_user.reviews
    @owner_meetings = current_user.meetings

    @bookings = set_bookings(@offers)

  end

  private

  def set_bookings(offers)
    booking = []
    offers.each do |offer|
    booking << offer.meetings
    end
    return booking.flatten
  end
end
