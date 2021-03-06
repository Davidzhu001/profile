class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).paginate(:page => params[:page]).all
    else
      @articles = Article.rubyOnRails.paginate(:page => params[:page], :per_page => 7)
    end
    authorize @articles
  end

  def personal_articles
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).paginate(:page => params[:page]).all
    else
      @articles = Article.lifeEvents.paginate(:page => params[:page], :per_page => 7)
    end
  end
  def cocoa_articles
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).paginate(:page => params[:page]).all
    else
      @articles = Article.cocoaSwift.paginate(:page => params[:page], :per_page => 7)
    end
  end
  # GET /articles/1
  # GET /articles/1.json
  def show
    @articles = Article.all
  end

  # GET /articles/new
  def new
    @article = Article.new
    authorize @article
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
      authorize @article
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :kype,  :tag_list,  :user_id)
    end
end
