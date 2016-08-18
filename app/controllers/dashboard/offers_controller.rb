class Dashboard::OffersController < ApplicationController
  def index
    @offers = current_user.offers
    @user = current_user
    @reviews = current_user.reviews
  end
end
