# coding: utf-8
class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @show_login = false
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    @user.status= true  #设定用户状态为有效
    @user.confirmed = false
    @code = UUIDTools::UUID.random_create
    @user.confirm_code = @code.to_str

    respond_to do |format|
      if @user.save
        #设定认证码信息
        @invite_code = Invitecode.find_by_code(params["inviteCode"])
        if @invite_code
          @invite_code.status = false
          @invite_code.enable_date= DateTime.current
          @invite_code.enable_user_id=@user.id
          @invite_code.save
        end

        #todo:自动建立互粉关系

        format.html { redirect_to send_confirmation_mail_user_path(@user)}
        #format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        @current_user = @user
        @fade_message = "用户信息更新成功！"
        format.html { render :action => "main_page" }
        format.xml  { head :ok }
        #实现文件上传的Ajax
        format.js {respond_to_parent{render :file => "/users/renew_avatar.js.erb"}}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  # GET method
  # Check the register mail
  def check_mail
    @user = User.find_by_email(params[:user][:email])

    respond_to do |format|
      format.json  { render :json => !@user }
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET method
  # check the name
  def check_name
     @user = User.find_by_name(params[:user][:name])

    respond_to do |format|
      format.json  { render :json => !@user }
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET method
  # check the invite code
  def check_invitecode
    @codes = Invitecode.where("code = ? AND status = ?", params["inviteCode"], true)

    @valid = @codes.size > 0
    #@valid = true
    respond_to do |format|
      format.json  { render :json => @valid }
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  #注册用户确认
  def user_confirmation
    @result = "s"  #success

    @user = User.find(params["userid"])

    if !@user
      @result = "e1"  #error1: no this user
    else
      if @user.confirmed
        @result = "e2"  #error2: has been confirmed
      else
        if @user.confirm_code != params["confirm_code"]
          @result = "e1"
        end
      end
    end

    if @result == "s"
      @user.confirmed= true
      @user.save()
      #generate invite codes for this user
      InvitecodesController.generate_invite_codes(@user.id,20)
    end

    respond_to do |format|
        format.html
    end
  end

  #send confirmation_mail for the user
  def send_confirmation_mail
    @user = User.find(params[:id])
    if (@user)
      Notifier.register_confirm(@user).deliver
      respond_to do |format|
          format.html
      end
    end
  end

  #用户登录页面
  def login
    @error = false
    @show_login = false
    @source_type = params["source_type"]
    @source_page = params["source_page"]

    #如果登录不是来源于弹出框的话，登录成功后就转到用户首页
    if (@source_type != "partial")
      @source_type = "normal"
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  #处理用户的登录信息
  def login_check
    @error = false
    @source_type = params["source_type"]
    @source_page = params["source_page"]
    @login_name = params["loginName"]
    @show_login = false
    user = User.authenticate(params["loginName"], params["password"])
    respond_to do |format|
      if !user    #登录验证失败
        @error = true
        @error_message = "您的登录信息有误，请检查后再次登录"
        format.html do
          render :action => "login"
        end
        #如果是用Ajax方式登录
        format.js do
          render :file => "/users/js_user_login_failure.js.erb"
        end
      else #用户验证通过
        session[:user_id] = user.id
        format.html do
          if @source_type == "normal"
            redirect_to main_page_user_path(user)
          else
            redirect_to @source_page
          end
        end

        #如果是用Ajax方式登录
        format.js do
          @submitter_id = params["submitter_id"]
          @click_id = params["click_id"]
          render :file => "/users/js_user_login_success.js.erb"
        end

      end
    end
  end

  def logout
    session.delete :user_id
    redirect_to :back
  end

  #用户首页
  def main_page
    if user_login_authorize
      @current_user
      respond_to do |format|
        format.html
      end
      end
  end

end
