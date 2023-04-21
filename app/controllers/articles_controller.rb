class ArticlesController < ApplicationController

  #callbacks
  before_action :authenticate_student!, except: %i[index show]


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
    authorize @article
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
    @article = Article.find(params[:id])
    authorize @article
    if @article.update(article_params)
      redirect_to@article
    else
      render :edit
    end
  end

  def destroy 
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  def published
    @articles = Article.published
  end

  def current_user
    current_student
  end

  private 

  def article_params
    params.require(:article).permit(:title, :body, :published, :book_id)
  end
end
