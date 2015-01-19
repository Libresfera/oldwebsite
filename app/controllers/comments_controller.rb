class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_article, only: [:index, :create, :new]

  respond_to :html

  def index
    @comments = @article.comments
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = @article.comments.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    @comment = @article.comments.new(comment_params)
    @comment.save
    respond_with(@comment)
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_article
      @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:content, :article_id)
    end
end
