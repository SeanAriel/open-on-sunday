class MesstousersController < ApplicationController

  # GET /messtousers
  # GET /messtousers.json
  def index
    @messtousers = Messtouser.all
  end

  # GET /messtousers/1
  # GET /messtousers/1.json
  def show
  end

  # GET /messtousers/new
  def new
    @messtouser = Messtouser.new
  end

  # GET /messtousers/1/edit
  def edit
  end

  # POST /messtousers
  # POST /messtousers.json

  # PATCH/PUT /messtousers/1
  # PATCH/PUT /messtousers/1.json
  def update
    respond_to do |format|
      if @messtouser.update(messtouser_params)
        format.html { render '/', notice: 'Messtouser was successfully updated.' }
        format.json { render :show, status: :ok, location: @messtouser }
      else
        format.html { render :edit }
        format.json { render json: @messtouser.errors, status: :unprocessable_entity }
      end
    end
  end

def destroy
  @messtouser.destroy
  redirect_to dashboard_offers_path
end

    # Never trust parameters from the scary internet, only allow the white list through.
    def messtouser_params
      params.require(:messtouser).permit(:title, :content, :user_id)
    end
end
