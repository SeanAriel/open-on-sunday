class ReviewsController < ApplicationController

  def create
    @review = Review.new

  end


  private


  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end


end
