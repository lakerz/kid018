class InvitecodesController < ApplicationController
  # GET /invitecodes
  # GET /invitecodes.xml
  def index
    @invitecodes = Invitecode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invitecodes }
    end
  end

  # GET /invitecodes/1
  # GET /invitecodes/1.xml
  def show
    @invitecode = Invitecode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invitecode }
    end
  end

  # GET /invitecodes/new
  # GET /invitecodes/new.xml
  def new
    @invitecode = Invitecode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invitecode }
    end
  end

  # GET /invitecodes/1/edit
  def edit
    @invitecode = Invitecode.find(params[:id])
  end

  # POST /invitecodes
  # POST /invitecodes.xml
  def create
    @invitecode = Invitecode.new(params[:invitecode])

    respond_to do |format|
      if @invitecode.save
        format.html { redirect_to(@invitecode, :notice => 'Invitecode was successfully created.') }
        format.xml  { render :xml => @invitecode, :status => :created, :location => @invitecode }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invitecode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invitecodes/1
  # PUT /invitecodes/1.xml
  def update
    @invitecode = Invitecode.find(params[:id])

    respond_to do |format|
      if @invitecode.update_attributes(params[:invitecode])
        format.html { redirect_to(@invitecode, :notice => 'Invitecode was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invitecode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invitecodes/1
  # DELETE /invitecodes/1.xml
  def destroy
    @invitecode = Invitecode.find(params[:id])
    @invitecode.destroy

    respond_to do |format|
      format.html { redirect_to(invitecodes_url) }
      format.xml  { head :ok }
    end
  end

  def check_invite_code

  end

  #生成邀请码
  #根据用户的id生成count数量的邀请码
  def InvitecodesController.generate_invite_codes(userid, num=20)
    0.upto(num) do |x|
      new_code = Invitecode.new
      new_code.create_user_id = userid
      new_code.code = userid.to_s + UUIDTools::UUID.random_create.to_str[0,6]
      new_code.status = true
      new_code.save
    end
  end
end
