class UserArticlesController < ApplicationController
  # GET /user_articles
  # GET /user_articles.xml
  def index
    @user_articles = UserArticle.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_articles }
    end
  end

  # GET /user_articles/1
  # GET /user_articles/1.xml
  def show
    @user_article = UserArticle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_article }
    end
  end

  # GET /user_articles/new
  # GET /user_articles/new.xml
  def new
    @user_article = UserArticle.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_article }
    end
  end

  # GET /user_articles/1/edit
  def edit
    @user_article = UserArticle.find(params[:id])
  end

  # POST /user_articles
  # POST /user_articles.xml
  def create
    @user_article = UserArticle.new(params[:user_article])

    respond_to do |format|
      if @user_article.save
        format.html { redirect_to(@user_article, :notice => 'User article was successfully created.') }
        format.xml  { render :xml => @user_article, :status => :created, :location => @user_article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_articles/1
  # PUT /user_articles/1.xml
  def update
    @user_article = UserArticle.find(params[:id])

    respond_to do |format|
      if @user_article.update_attributes(params[:user_article])
        format.html { redirect_to(@user_article, :notice => 'User article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_articles/1
  # DELETE /user_articles/1.xml
  def destroy
    @user_article = UserArticle.find(params[:id])
    @user_article.destroy

    respond_to do |format|
      format.html { redirect_to(user_articles_url) }
      format.xml  { head :ok }
    end
  end
end
