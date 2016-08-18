class MeetingsController < ApplicationController
  before_action :set_offer, only: [:create, :new, :edit, :update]
  before_action  :authenticate_user!, only: [:new, :create]

    def new
      @meeting = Meeting.new()
    end

    def create
      # number_to_currency( )
      @meeting = Meeting.new(meeting_params)
      @meeting.user_id = current_user.id
      @meeting.status = "start"
      @meeting.offer = @offer
      @meeting.save!
      redirect_to offer_path(@offer)
    end




    private
      # Use callbacks to share common setup or constraints between actions.
      # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:availability)
    end
    def set_offer
      @offer = Offer.find(params[:offer_id])
    end


end
