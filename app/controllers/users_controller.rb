class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:id] = @user.id
  		redirect_to user_path id: session[:id]
  	else
  		redirect_to new_user_path, flash: { reg_errors: @user.errors.full_messages }
  	end
  end

  def login
  	@user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
    if @user.blank?
      redirect_to new_user_path, flash: { login_error: 'Email and/or password do not match our records' }
    else
      session[:id] = @user.id
      redirect_to user_path id: session[:id]
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end


  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
