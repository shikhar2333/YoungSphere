class ScanImagesController < ApplicationController
  before_action :set_scan_image, only: [:show, :edit, :update, :destroy]

  # GET /scan_images
  # GET /scan_images.json
  include ScanImagesHelper
  def index
    @scan_images = ScanImage.all
  end

  # GET /scan_images/1
  # GET /scan_images/1.json
  def show
  end

  # GET /scan_images/new
  def new
    @scan_image = ScanImage.new
  end

  # GET /scan_images/1/edit
  def edit
  end

  # POST /scan_images
  # POST /scan_images.json
  def create
    @scan_image = ScanImage.new(scan_image_params)
    # @scan_image.user_id = current_user.id
    @scan_image.update_attribute(:user_id, current_user.id)
    if @scan_image.save!
      @scan_image.scanned_image.attach(params[:scan_image][:scanned_image])
      @scan_image.update_attribute(:label, upload_image_s3(@scan_image) )
      redirect_to root_path 
    else
      render 'new'
    end
  end

  # PATCH/PUT /scan_images/1
  # PATCH/PUT /scan_images/1.json
  def update
    respond_to do |format|
      if @scan_image.update(scan_image_params)
        format.html { redirect_to @scan_image, notice: 'Scan image was successfully updated.' }
        format.json { render :show, status: :ok, location: @scan_image }
      else
        format.html { render :edit }
        format.json { render json: @scan_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scan_images/1
  # DELETE /scan_images/1.json
  def destroy
    @scan_image.destroy
    respond_to do |format|
      format.html { redirect_to scan_images_url, notice: 'Scan image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scan_image
      @scan_image = ScanImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scan_image_params
      params.require(:scan_image).permit(:label, :scanned_image)
    end
end
