class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_article
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @article, notice: 'Comment was successfully created.'
    else
      redirect_to @article, alert: 'There was an error creating the comment.'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @article, notice: 'Comment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      redirect_to @article, notice: 'Comment was successfully destroyed.'
    else
      redirect_to @article, alert: 'There was an error deleting the comment.'
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def authorize_user!
    unless @comment.user == current_user || @article.user == current_user
      redirect_to @article, alert: 'You are not authorized to delete this comment.'
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
