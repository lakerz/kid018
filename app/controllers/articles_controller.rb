# coding: utf-8
class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.read(params[:id])
    @article_comments = ArticleComment.where("article_id = ? AND lighted = ?", @article.id, false).order("created_at DESC").paginate(:page => params[:page])
    @lighted_comments = ArticleComment.where("article_id = ? AND lighted = ?", @article.id, true).order("created_at DESC")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    if params[:board_id]
      @article.board = Board.find(params[:board_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])

  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end

  def add_comment
    redirect_to '/'
  end


  def recommand
    @article = Article.ding(params[:id])
    @floating_fade_message = "成功推荐！"
    respond_to do |format|
      format.js
    end

  end

  def add_favorite
     if @current_user
      #if UserArticle.find_by
      article = Article.find(params[:id])
      user_article = @current_user.user_articles.build(article)
      user_article.save
      @floating_fade_message = "收藏成功！"
    else
      @floating_fade_message = "当前用户已失效，请重新登录后收藏！"
    end

    respond_to do |format|
      format.js
      format.html # new.html.erb
    end
  end

end
