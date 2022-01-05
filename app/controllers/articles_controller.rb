class ArticlesController < ApplicationController
  # all users allowed to access index & show
  # ONLY authenticated users allowed to access the rest routes
  before_action :authenticate_user!, :except => [:index, :show]
  # :authenticate_user! is a method provided by Devise

  # before_action :set_user

  
  # The simplest way for authentication:
  # http_basic_authenticate_with name: "name", password: "pass", except: [:index, :show]

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
    @article = Article.new(article_params.merge(user_id: current_user.id))

    if @article.save!
      flash[:success] = "Article created"
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

    if @article.update(article_params.merge(user_id: current_user.id))
      redirect_to @article
    else
      render :edit, status: :unporocessable_entity
    end
  end

  # action to delete an arctile
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end


  private
  
  # def set_user
  #   @user = User.find(params[:id])
  # end

  def article_params
    params.require(:article).permit(:title, :body, :user_id)
  end
end
