class ArticlesController < ApplicationController
  # action for the list page
  def index
    @articles = Article.all
  end

  # action for the details page
  def show
    @article = Article.find(params[:id])
  end
end
