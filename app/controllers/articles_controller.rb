class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article  = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    p "1111111111111111111"
    p article_params
    p "1111111111111111111"
    
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to@article
    else
      render :edit
    end
  end

  def destroy 
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  def published
    @articles = Article.published
  end
  private 
    def article_params
      params.require(:article).permit(:title, :body, :published)
    end
end
