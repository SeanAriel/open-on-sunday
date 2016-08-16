class OffersController < ApplicationController

  before_action :authenticate_user!, only: [:create]
#  accept_nested_attributes_for :availabilities, :allow_destroy => true

    def new
       @offer = Offer.new
    end


   def create
    # number_to_currency( )
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    @offer.sold = false

    @offer.save!
    redirect_to 'pages#home'

   end



    private
      # Use callbacks to share common setup or constraints between actions.
     def set_offer
        @offer = Offer.find(params[:id])
     end
      # Never trust parameters from the scary internet, only allow the white list through.
      def offer_params
        params.require(:offer).permit(:name, :price, :description, :category_id, :city)
      end
end
