module Admin
  class ArticlesController < AdminController
    private

    def article_params
      params.require(:article).permit(:title, :content)
    end
  end
end
