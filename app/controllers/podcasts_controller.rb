class PodcastsController < ApplicationController
  before_action :set_podcast, only: :show

  respond_to :html

  def index
    @podcasts = Podcast.all
    respond_with(@podcasts)
  end

  def show
    respond_with(@article)
  end

  private

  def set_podcast
    @podcast = Podcast.find(params[:id])
  end
end
