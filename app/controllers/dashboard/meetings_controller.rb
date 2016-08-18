class Dashboard::MeetingsController < ApplicationController
  before_action :set_meeting, only: [:confirm, :decline]

  def confirm
    @meeting.update(status: "confirmed")
    redirect_to dashboard_offers_path
  end

  def decline
    @meeting.update(status: "declined")
    redirect_to dashboard_offers_path
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])

    if @meeting.offer.user != current_user
      redirect_to root_path
    end
  end
end
