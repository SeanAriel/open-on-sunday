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
  def create
    @messtouser = Messtouser.new(messtouser_params)

    respond_to do |format|
      if @messtouser.save
        format.html { redirect_to @messtouser, notice: 'Messtouser was successfully created.' }
        format.json { render :show, status: :created, location: @messtouser }
      else
        format.html { render :new }
        format.json { render json: @messtouser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messtousers/1
  # PATCH/PUT /messtousers/1.json
  def update
    respond_to do |format|
      if @messtouser.update(messtouser_params)
        format.html { redirect_to @messtouser, notice: 'Messtouser was successfully updated.' }
        format.json { render :show, status: :ok, location: @messtouser }
      else
        format.html { render :edit }
        format.json { render json: @messtouser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messtousers/1
  # DELETE /messtousers/1.json



    # Never trust parameters from the scary internet, only allow the white list through.
    def messtouser_params
      params.require(:messtouser).permit(:title, :content, :user_id)
    end
end
