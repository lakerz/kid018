class ArticleCommentsController < ApplicationController
  # GET /article_comments
  # GET /article_comments.xml
  def index
    @article_comments = ArticleComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @article_comments }
    end
  end

  # GET /article_comments/1
  # GET /article_comments/1.xml
  def show
    @article_comment = ArticleComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article_comment }
    end
  end

  # GET /article_comments/new
  # GET /article_comments/new.xml
  def new
    @article_comment = ArticleComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article_comment }
    end
  end

  # GET /article_comments/1/edit
  def edit
    @article_comment = ArticleComment.find(params[:id])
  end

  # POST /article_comments
  # POST /article_comments.xml
  def create
    @article = Article.find(params[:article_id])
    @article_comment = @article.article_comments.build()
    @article_comment.content = params[:replyContent]

    respond_to do |format|
      if @article_comment.save
        #format.html { redirect_to @article, :anchor => 'comment' }
        format.html { redirect_to(article_path(@article, :anchor => "comment", :page=>1)) }

        format.xml  { render :xml => @article_comment, :status => :created, :location => @article_comment }
      else
        format.html { redirect_to(@article) }
        format.xml  { render :xml => @article_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /article_comments/1
  # PUT /article_comments/1.xml
  def update
    @article_comment = ArticleComment.find(params[:id])

    respond_to do |format|
      if @article_comment.update_attributes(params[:article_comment])
        format.html { redirect_to(@article_comment, :notice => 'Article comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /article_comments/1
  # DELETE /article_comments/1.xml
  def destroy
    @article_comment = ArticleComment.find(params[:id])
    @article_comment.destroy

    respond_to do |format|
      format.html { redirect_to(article_comments_url) }
      format.xml  { head :ok }
    end
  end

  #GET /article_comments/
  def light

    #todo: add the permission control

    @article_comment = ArticleComment.find(params[:id])

    if params[:set] == "on"
      @article_comment.lighted= true;
    else
      @article_comment.lighted = false;
    end

    respond_to do |format|
      if @article_comment.save
        #format.html { redirect_to @article, :anchor => 'comment' }
        #format.html { redirect_to(article_path(@article, :anchor => "comment", :page=>1)) }
        format.js
        format.xml  { render :xml => @article_comment, :status => :created, :location => @article_comment }
      else
        format.html { redirect_to(@article) }
        format.xml  { render :xml => @article_comment.errors, :status => :unprocessable_entity }
      end
    end
  end
end
