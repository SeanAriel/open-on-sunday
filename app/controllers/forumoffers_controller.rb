class ForumoffersController < ApplicationController

  def create
   @offer = Offer.find(params[:offer_id])
   @forum = Forumoffer.new(review_params)
   @forum[:user_id] = current_user.id
   @forum.offer = @offer
   if @forum.save!
     redirect_to offer_path(@offer)
   else
     render 'offers/show'
   end
 end
private
 def review_params
    params.require(:forumoffer).permit(:content)
  end
end
