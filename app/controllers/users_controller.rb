class UsersController < ApplicationController
   attr_accessor :first_name
  def show
    @user = User.find(params[:id])

        @buy_review_received = @user.meetings.map do |meeting|
          meeting.reviews.where.not(user_id: @user.id)
        end

        @sell_reviews = []
        @user.offers.each do |offer|
          offer.meetings.each do |meeting|
          @sell_reviews << meeting.reviews.where.not(user_id: @user.id)
          end
        end
  end
end
