class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :destroy_confirmation]
  before_action :set_article, only: [:show, :edit, :update, :destroy, :destroy_confirmation]
  before_action :authorize_user!, only: [:edit, :update, :destroy, :destroy_confirmation]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy_confirmation
    # Render a confirmation page
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find_by(id: params[:id])
    unless @article
      redirect_to root_path, alert: "Article not found."
    end
  end

  def authorize_user!
    unless @article && @article.user == current_user
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
