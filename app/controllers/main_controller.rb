class MainController < ApplicationController
  def index
    @boards=Board.all
    @goto_login_page = true
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
