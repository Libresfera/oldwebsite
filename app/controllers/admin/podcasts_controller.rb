module Admin
  class PodcastsController < ApplicationController
    before_action :set_podcast, only: [:edit, :update, :destroy]

    respond_to :html

    def index
      @podcasts = Podcast.all
    end

    def new
      @podcast = Podcast.new
    end

    def edit
    end

    def create
      @podcast = Podcast.new(podcast_params)
      flash[:notice] = 'Podcast was successfully created.' if @podcast.save
      respond_with @podcast, location: admin_podcasts_path
    end

    def update
      flash[:notice] = 'Podcast was successfully updated.' if @podcast.update(podcast_params)
      respond_with @podcast, location: admin_podcasts_path
    end

    def destroy
      @podcast.destroy
      flash[:notice] = 'Podcast was successfully destroyed.'
      respond_with(:admin, @podcast)
    end

    private

    def set_podcast
      @podcast = Podcast.find(params[:id])
    end

    def podcast_params
      params.require(:podcast).permit(:title, :description, :thumbnail, :audio)
    end
  end
end
