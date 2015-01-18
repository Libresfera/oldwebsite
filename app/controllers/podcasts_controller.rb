class PodcastsController < ApplicationController
  before_action :set_podcast, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @podcasts = Podcast.all
    respond_with(@podcasts)
  end

  def show
    respond_with(@article)
  end

  def new
    @podcast = Podcast.new
    respond_with(@podcast)
  end

  def edit
  end

  def create
    @podcast = Podcast.new(podcast_params)
    flash[:notice] = 'Podcast was successfully created.' if @podcast.save
    respond_with @podcast
  end

  def update
    flash[:notice] = 'Podcast was successfully updated.' if @podcast.update(podcast_params)
    respond_with @podcast
  end

  def destroy
    @podcast.destroy
    flash[:notice] = 'Podcast was successfully destroyed.'
    respond_with @podcast
  end

  private

  def set_podcast
    @podcast = Podcast.find(params[:id])
  end

  def podcast_params
    params.require(:podcast).permit(:title, :description, :thumbnail, :audio)
  end
end
