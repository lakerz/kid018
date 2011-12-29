class ArticleCommentRepliesController < ApplicationController
  # GET /article_comment_replies
  # GET /article_comment_replies.xml
  def index
    @article_comment_replies = ArticleCommentReply.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @article_comment_replies }
    end
  end

  # GET /article_comment_replies/1
  # GET /article_comment_replies/1.xml
  def show
    @article_comment_reply = ArticleCommentReply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article_comment_reply }
    end
  end

  # GET /article_comment_replies/new
  # GET /article_comment_replies/new.xml
  def new
    @comment_id = params[:commentid]
    @comment = ArticleComment.find(@comment_id)

    @article_comment_reply = ArticleCommentReply.new
    @article_comment_reply.comment_id= @comment_id

    respond_to do |format|
      #format.html # new.html.erb
      format.html { render :layout => 'simple'} # use a different layout
      format.xml  { render :xml => @article_comment_reply }
    end
  end

  # GET /article_comment_replies/1/edit
  def edit
    @article_comment_reply = ArticleCommentReply.find(params[:id])
  end

  # POST /article_comment_replies
  # POST /article_comment_replies.xml
  def create
    @article_comment = ArticleComment.find(params[:comment_id])
    @article_comment_reply = @article_comment.article_comment_replies.build()
    @article_comment_reply.content = params[:commentReplyContent]

    respond_to do |format|
      if @article_comment_reply.save
        # format.html { redirect_to(@article_comment_reply, :notice => 'Article comment reply was successfully created.') }
        format.html { redirect_to(article_path(@article_comment.article, :anchor => "comment_"+@article_comment.id.to_s)) }
        format.js  # 指向一个AJAX
        format.xml  { render :xml => @article_comment_reply, :status => :created, :location => @article_comment_reply }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article_comment_reply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /article_comment_replies/1
  # PUT /article_comment_replies/1.xml
  def update
    @article_comment_reply = ArticleCommentReply.find(params[:id])

    respond_to do |format|
      if @article_comment_reply.update_attributes(params[:article_comment_reply])
        format.html { redirect_to(@article_comment_reply, :notice => 'Article comment reply was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article_comment_reply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /article_comment_replies/1
  # DELETE /article_comment_replies/1.xml
  def destroy
    @article_comment_reply = ArticleCommentReply.find(params[:id])
    @article_comment_reply.destroy

    respond_to do |format|
      format.html { redirect_to(article_comment_replies_url) }
      format.xml  { head :ok }
    end
  end
end
