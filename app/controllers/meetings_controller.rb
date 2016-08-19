class MeetingsController < ApplicationController
  before_action :set_offer, only: [:create, :new, :edit, :update]
  before_action  :authenticate_user!, only: [:new, :create]
  before_action :set_meeting, only: [:edit, :destroy, :update, :confirm]
    def new
      @meeting = Meeting.new()
    end

    def create
      # number_to_currency( )
      @user = current_user
      @meeting = Meeting.new(meeting_params)
      @meeting.user_id = current_user.id
      @meeting.status = "Requested to Issuer"
      @meeting.offer = @offer
      @meeting.save!
      redirect_to dashboard_offers_path
    end

    def edit
    end

    def update
      if @meeting.status == "Requested to Issuer"
        if @meeting.save!(meeting_params)

           @mess = Messtouser.new(title: 'Meeting Changed', content:" #{current_user.email} changed his date for the meeting #{@meeting.availability}", user_id: @meeting.offer.user_id)
           @mess.save!
           redirect_to dashboard_offers_path
        else
          render :edit
        end
      else
        flash[:alert] = "The meeting has been fixed already"
        redirect_to dashboard_offers_path
      end
    end

    def destroy
      @meeting.destroy
      redirect_to dashboard_offers_path
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      # Never trust parameters from the scary internet, only allow the white list through.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:availability)
    end
    def set_offer
      @offer = Offer.find(params[:offer_id])
    end


end
