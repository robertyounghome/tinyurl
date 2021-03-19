class AvailableUrlsController < ApplicationController
  before_action :set_available_url, only: %i[ show edit update destroy ]

  # GET /available_urls or /available_urls.json
  def index
    @available_urls = AvailableUrl.all
  end

  # GET /available_urls/1 or /available_urls/1.json
  def show
  end

  # GET /available_urls/new
  def new
    @available_url = AvailableUrl.new
  end

  # GET /available_urls/1/edit
  def edit
  end

  # POST /available_urls or /available_urls.json
  def create
    @available_url = AvailableUrl.new(available_url_params)

    respond_to do |format|
      if @available_url.save
        format.html { redirect_to @available_url, notice: "Available url was successfully created." }
        format.json { render :show, status: :created, location: @available_url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @available_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /available_urls/1 or /available_urls/1.json
  def update
    respond_to do |format|
      if @available_url.update(available_url_params)
        format.html { redirect_to @available_url, notice: "Available url was successfully updated." }
        format.json { render :show, status: :ok, location: @available_url }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @available_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /available_urls/1 or /available_urls/1.json
  def destroy
    debugger
    @available_url.destroy
    respond_to do |format|
      format.html { redirect_to available_urls_url, notice: "Available url was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_available_url
      @available_url = AvailableUrl.find_by(name: params[:name])
    end

    # Only allow a list of trusted parameters through.
    def available_url_params
      params.require(:available_url).permit(:name)
    end
end
