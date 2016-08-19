class Dashboard::OffersController < ApplicationController
  def index
    @offers = current_user.offers
    @user = current_user
    @owner_meetings = current_user.meetings
    @messtousers = current_user.messtousers
    @bookings = set_bookings(@offers)

    #@reviews_give = current_user.reviews #review you gave to other ppl

    @buy_review_received = current_user.meetings.map do |meeting|
      meeting.reviews.where.not(user_id: current_user.id)
    end

    @sell_reviews = []
    current_user.offers.each do |offer|
      offer.meetings.each do |meeting|
      @sell_reviews << meeting.reviews.where.not(user_id: current_user.id)
      end
    end
    # current_user.offers.each do |offer|
    #   offers.meetings.each do |meeting|
    #     @sell_reviews << meeting.reviews.where.not(user_id: current_user.id)
    #   end
    # end

  end

  private

  def set_bookings(offers)
    booking = []
    offers.each do |offer|
    booking << offer.meetings
    end
    return booking.flatten
  end
  def find_reviews_received
    @review_received = User.find(2).meetings.map do |meeting|
      meeting.reviews.where.not(user_id: current_user.id)
    end
  end
end
