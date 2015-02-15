module Admin
  class PodcastsController < AdminController
    private

    def podcast_params
      params.require(:podcast).permit(:title, :description, :thumbnail, :audio)
    end
  end
end
