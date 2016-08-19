class Dashboard::MesstousersController < ApplicationController
  before_action :set_messtouser, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @messages = current_user.messtousers
  end
  def destroy
    @messtouser.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_offers_path, notice: 'Messtouser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_messtouser
      @messtouser = Messtouser.find(params[:id])
    end


end
