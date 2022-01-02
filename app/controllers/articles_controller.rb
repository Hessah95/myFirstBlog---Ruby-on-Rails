class ArticlesController < ApplicationController
  # action for the list page
  def index
    @articles = Article.all
  end

  # action for the details page
  def show
    @article = Article.find(params[:id])
  end

  # action to get a form for new article
  def new
    @article = Article.new
  end

  # action to create a new article
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unporocessable_entity
    end
  end

  # action to get a form for updating an article
  def edit
    @article = Article.find(params[:id])
  end

  # action to update an article
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unporocessable_entity
    end
  end


  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
