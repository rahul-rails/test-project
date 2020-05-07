class ImageUploadsController < ApplicationController
  before_action :set_image_upload, only: [:show]

  # GET /image_uploads/1
  # GET /image_uploads/1.json
  def show
  end

  # GET /image_uploads/new
  def new
    @image_upload = ImageUpload.new
  end

  # POST /image_uploads
  # POST /image_uploads.json
  def create
    @image_upload = ImageUpload.new(image_upload_params)
    respond_to do |format|
      if @image_upload.save
        format.html { redirect_to @image_upload, notice: 'Image upload was successfully created.' }
        format.json { render :show, status: :created, location: @image_upload }
      else
        format.html { render :new }
        format.json { render json: @image_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def random_image_urls
    image_uploads = ActiveStorage::Attachment.where(record_type: "ImageUpload").limit(10).order("RANDOM()")
    @images = image_uploads.map {|image| rails_blob_path(image) }

    render json: @images
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_upload
      @image_upload = ImageUpload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_upload_params
      params.require(:image_upload).permit(images: [])
    end
end
