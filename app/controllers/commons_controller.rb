class CommonsController < ApplicationController
  before_action :set_common, only: [:show, :edit, :update, :destroy]
 skip_before_filter :verify_authenticity_token  
  # GET /commons
  # GET /commons.json
  def index
    

a="EKFWHGC1NHDS5ZUZYLV3I2GTKSIQBAB5JC51WY3DM541QQGS"
b="OAZFDFYZMSG4PO1IY4NDRFQI4TBEYL5TJHFGOH03VDNAZRLU"


foursquare = Foursquare::Base.new(a, b)
foursquare.authorize_url("http://0f371008.ngrok.io/commons")

# https://foursquare.com/oauth2/authenticate?client_id=EKFWHGC1NHDS5ZUZYLV3I2GTKSIQBAB5JC51WY3DM541QQGS&response_type=code&redirect_uri=http://0f371008.ngrok.io/commons
   
access_token = foursquare.access_token(params["code"], "http://0f371008.ngrok.io/commons")

debugger

    # client = Foursquare2::Client.new(:oauth_token => params[:code],:client_id=>a,:client_secret=>b,:api_version => '20120505')



    @commons = Common.all
  end

  # GET /commons/1
  # GET /commons/1.json
  def show
  end

  # GET /commons/new
  def new
    @common = Common.new
  end

  # GET /commons/1/edit
  def edit
  end

  # POST /commons
  # POST /commons.json
  def create

  debugger

  end

  # PATCH/PUT /commons/1
  # PATCH/PUT /commons/1.json
  def update
    respond_to do |format|
      if @common.update(common_params)
        format.html { redirect_to @common, notice: 'Common was successfully updated.' }
        format.json { render :show, status: :ok, location: @common }
      else
        format.html { render :edit }
        format.json { render json: @common.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commons/1
  # DELETE /commons/1.json
  def destroy
    @common.destroy
    respond_to do |format|
      format.html { redirect_to commons_url, notice: 'Common was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common
      @common = Common.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def common_params
      params.fetch(:common, {})
    end
end
