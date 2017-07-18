class UseradminsController < ApplicationController
  before_action :set_useradmin, only: [:show, :edit, :update, :destroy]

  # GET /useradmins
  # GET /useradmins.json
  def index
    @useradmins = Useradmin.all
  end

  # GET /useradmins/1
  # GET /useradmins/1.json
  def show
  end

  # GET /useradmins/new
  def new
    @useradmin = Useradmin.new
  end

  # GET /useradmins/1/edit
  def edit
  end

  # POST /useradmins
  # POST /useradmins.json
  def create
    @useradmin = Useradmin.new(useradmin_params)

    respond_to do |format|
      if @useradmin.save
        format.html { redirect_to @useradmin, notice: 'Useradmin was successfully created.' }
        format.json { render :show, status: :created, location: @useradmin }
      else
        format.html { render :new }
        format.json { render json: @useradmin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /useradmins/1
  # PATCH/PUT /useradmins/1.json
  def update
    respond_to do |format|
      if @useradmin.update(useradmin_params)
        format.html { redirect_to @useradmin, notice: 'Useradmin was successfully updated.' }
        format.json { render :show, status: :ok, location: @useradmin }
      else
        format.html { render :edit }
        format.json { render json: @useradmin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /useradmins/1
  # DELETE /useradmins/1.json
  def destroy
    @useradmin.destroy
    respond_to do |format|
      format.html { redirect_to useradmins_url, notice: 'Useradmin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_useradmin
      @useradmin = Useradmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def useradmin_params
      params.require(:useradmin).permit(:name, :email)
    end
end
