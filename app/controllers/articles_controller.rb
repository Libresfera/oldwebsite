class ArticlesController < ApplicationController
  before_action :set_article, only: :show

  respond_to :html

  def index
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    respond_with(@article)
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
