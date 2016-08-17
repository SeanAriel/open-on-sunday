class OffersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
#  accept_nested_attributes_for :availabilities, :allow_destroy => true
  before_action :set_offer, only: [:show, :destroy, :edit, :update]
  def new
    @offer = Offer.new
  end

    def index
      @offers = Offer.all
    end


  def create
    # number_to_currency( )
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    @offer.sold = false

    @offer.save!
    redirect_to offer_path(@offer)

  end

  def show
    @alert_message = 'Careful bro'
    @user = @offer.user
    # @offer_coordinates = { lat: @offer.latitude, lng: @offer.longitude }.to_json
    @offers = Offer.near(@offer.city, 5)
    if @offer.latitude && @offer.longitude
      @hash = Gmaps4rails.build_markers(@offers) do |offer, marker|
        marker.lat offer.latitude
        marker.lng offer.longitude
        # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
      end
    end
    # @reviews = @user.reviews.where(rating: 5).limit(3)
    # @reviews << Review.where('rating < 2').limit(1)
  end

  def edit
  end

  def update
    if current_user == @offer.user
      @offer.update(offer_params)
      redirect_to offer_path(@offer)
    else
      redirect_to offer_path(@offer)
    end
  end

  def destroy
    if current_user == @offer.user
      @offer.destroy
      redirect_to '/'
    else
      redirect_to offer_path(@offer)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
  end
    # Never trust parameters from the scary internet, only allow the white list through.
  def offer_params
    params.require(:offer).permit(:name, :price, :description, :category_id, :city, :photo, :photo_cache)
  end
end
