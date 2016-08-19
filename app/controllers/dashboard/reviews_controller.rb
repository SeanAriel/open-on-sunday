class Dashboard::ReviewsController < ApplicationController
  before_action :set_meeting, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.meeting = @meeting
    @review.user = current_user
    #@review = @meeting.build.reviews(review_params)
    @review.save
    redirect_to dashboard_offers_path
  end


  private

  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
