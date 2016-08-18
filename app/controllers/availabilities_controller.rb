class AvailabilitiesController < ApplicationController

  before_action :set_offer, only: [:create, :new, :edit, :update]
  before_action :set_availabily, only: [:edit]

  def new
    @availability = Availability.new()
  end

  def create
    @availability = Availability.new(availability_params)
    @availability[:offer_id] = @offer.id
    #@availability = @offer.build.availability(availability_params)
    @availability.save!

    redirect_to offer_path(@offer)
  end

  def edit
  end

  def update
  respond_to do |format|
      if @availability.update(article_params)
      else
         render :edit
      end
    end
  end

  private

  def set_availabily
    @availability = Availability.find(params[:id])
  end

  def availability_params
    params.require(:availability).permit(:startdate, :stopdate)
  end
  def set_offer
    @offer = Offer.find(params[:offer_id])
  end


end
