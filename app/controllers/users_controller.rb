class UsersController < ApplicationController
   attr_accessor :first_name
  def show
    @user = User.find(params[:id])
    @offers = @user.offers
    @owner_meetings = @user.meetings

    @messtousers = @user.messtousers
    @bookings = set_bookings(@offers)

    #@reviews_give = @user.reviews #review you gave to other ppl

    @buy_review_received = @user.meetings.map do |meeting|
      meeting.reviews.where.not(user_id: @user.id)
    end

    @sell_reviews = []
    @user.offers.each do |offer|
      offer.meetings.each do |meeting|
      @sell_reviews << meeting.reviews.where.not(user_id: @user.id)
      end
    end
    # @user.offers.each do |offer|
    #   offers.meetings.each do |meeting|
    #     @sell_reviews << meeting.reviews.where.not(user_id: @user.id)
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
end
