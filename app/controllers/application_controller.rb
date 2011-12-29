class ApplicationController < ActionController::Base
  before_filter :current_user, :common_setting
  protect_from_forgery

    private
    def common_setting
      @fade_message = "no message"      #要使用的action，就重新设置该值
      @floating_fade_message = "no message"      #要使用的action，就重新设置该值
      @show_login = true  #true时显示登录链接，否则不显示
      @goto_login_page = false  #false时，点击登录链接是以弹出框形式，否则到登录页面
    end

    def current_user
      @current_user = User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      @current_user = nil
    end

    #要求用户登录
    def user_login_authorize
      if !@current_user
        redirect_to login_users_path
        false
      else
        true
      end
    end

    #要求是有效用户
    def effective_user_authorize
      if user_login_authorize
        case @current_user.status
          when "disable"
            #转向到要求确认用户有效性的页面
            false
          when "unconfirmed"
            #转向到要求用户认证的页面
            false
          else
            true
        end
      else
        false
      end
    end

end
