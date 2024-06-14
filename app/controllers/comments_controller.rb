class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_article


  def index
    @comments = @article.comments
  end

  def show
  end

  def new
    @comment = @article.comments.build
  end

  def edit
  end

  def create
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to @article, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @article, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to article_comments_url(@article), notice: 'Comment was successfully destroyed.'
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter_name, :body)
  end
end
