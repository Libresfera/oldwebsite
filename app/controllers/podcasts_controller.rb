class PodcastsController < ApplicationController
  before_action :set_podcast, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /podcasts
  # GET /podcasts.json
  def index
    @podcasts = Podcast.all
  end

  # GET /podcasts/1
  # GET /podcasts/1.json
  def show
  end

  # GET /podcasts/new
  def new
    @podcast = Podcast.new
  end

  # GET /podcasts/1/edit
  def edit
  end

  # POST /podcasts
  # POST /podcasts.json
  def create
    @podcast = Podcast.new(podcast_params)
    flash[:notice] = 'Podcast was successfully created.' if @podcast.save
    respond_with @podcast
  end

  # PATCH/PUT /podcasts/1
  # PATCH/PUT /podcasts/1.json
  def update
    flash[:notice] = 'Podcast was successfully updated.' if @podcast.update(podcast_params)
    respond_with @podcast
  end

  # DELETE /podcasts/1
  # DELETE /podcasts/1.json
  def destroy
    @podcast.destroy
    flash[:notice] = 'Podcast was successfully destroyed.'
    respond_with @podcast
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_podcast
    @podcast = Podcast.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def podcast_params
    params.require(:podcast).permit(:title, :description, :thumbnail, :audio)
  end
end
