class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    @article = Article.new
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = 'Article was successfully created.'
      redirect_to articles_path      
    else
      @articles = []
      render "articles/index"
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article,
          notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render "articles/index" }
        format.json { render json: @article.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    flash[:success] = 'Article was successfully destroyed.'
    redirect_to articles_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
