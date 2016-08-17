class OffersController < ApplicationController

  before_action :authenticate_user!, only: [:create]
#  accept_nested_attributes_for :availabilities, :allow_destroy => true
  before_action :set_offer, only: [:show]
    def new
       @offer = Offer.new
    end


   def create
    # number_to_currency( )
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    @offer.sold = false

    @offer.save!
    redirect_to '/'

   end

   def show
    @alert_message = 'Careful bro'
    @user = @offer.user
    @offer_coordinates = { lat: @offer.lat, lng: @offer.lng }.to_json
    # @reviews = @user.reviews.where(rating: 5).limit(3)
    # @reviews << Review.where('rating < 2').limit(1)

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
