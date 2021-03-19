class UsedUrlsController < ApplicationController
  before_action :set_used_url, only: %i[ show edit update destroy ]

  # GET /used_urls or /used_urls.json
  def index
    @used_urls = UsedUrl.all
  end

  # GET /used_urls/1 or /used_urls/1.json
  def show
    # perhaps check if we should get a valid return from the long name first 
    # Actually, maybe not, it really isnt our responsibility
    if @used_url
      redirect_to @used_url.long_name
    else
      format.html { redirect_to edit_used_url_path(@used_url.short_name), notice: "Unable to Link to the TinyUrl." }
      format.json { render :show, status: :created, location: edit_used_url_path(@used_url.short_name) }
    end
  end

  # GET /used_urls/new
  def new
    @used_url = UsedUrl.new
  end

  # GET /used_urls/1/edit
  def edit
  end

  # POST /used_urls or /used_urls.json
  def create
    # How terrible this is right now retrieving AvailableUrl.all 
    @used_url = UsedUrl.new(used_url_params)
    @used_url.short_name = AvailableUrl.all.first.name
    @used_url.available_url.delete
    @used_url.last_used = Time.now

    respond_to do |format|
      if @used_url.save
        format.html { redirect_to edit_used_url_path(@used_url.short_name), 
              notice: "A TinyURL was successfully created." }
        format.json { render :show, status: :created, 
              location: edit_used_url_path(@used_url.short_name) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @used_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /used_urls/1 or /used_urls/1.json
  def update
    @used_url.last_used = Time.now
    respond_to do |format|
      if @used_url.update(used_url_params)
        format.html { redirect_to edit_used_url_path(@used_url.short_name), notice: "TinyURL was successfully updated." }
        format.json { render :show, status: :ok, location: edit_used_url_path(@used_url.short_name) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @used_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /used_urls/1 or /used_urls/1.json
  def destroy
    @used_url.destroy
    respond_to do |format|
      format.html { redirect_to used_urls_url, notice: "TinyURL was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_used_url
      @used_url = UsedUrl.find_by(short_name: params[:short_name])
    end

    # Only allow a list of trusted parameters through.
    def used_url_params
      params.require(:used_url).permit(:long_name)
    end
end
