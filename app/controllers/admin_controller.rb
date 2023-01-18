class AdminController < ApplicationController
  def login
    if request.post?
      if params[:username]=="kush" && params[:password]=="123456"
        session[:admin]="kush"
        redirect_to projects_path
      else
        flash[:notice]="Invalid username/password"
        render :action => "login"
      end
    end
  end

  def logout
    session[:admin]=nil
    flash[:notice]="You are logged out"
    redirect_to :action => :login
  end
end
