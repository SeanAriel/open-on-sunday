class Dashboard::MeetingsController < ApplicationController
  before_action :set_meeting, only: [:confirm, :decline]

  def confirm
    @meeting.update(status: "confirmed")
    @mess = Messtouser.new(title: 'Meeting Confirmed', content:" #{current_user.email} has confirmed this meeting #{}", user_id: @meeting.user_id)
       @mess.save!
    redirect_to dashboard_offers_path
  end

  def decline
    @meeting.update(status: "declined")
    @mess = Messtouser.new(title: 'Meeting Declined', content:" #{current_user.email} has declined to meet you", user_id: @meeting.user_id)
       @mess.save!
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
