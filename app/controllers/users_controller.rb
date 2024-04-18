class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end
  
  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path
    else
      render :edit
      
    end
  end
  
  def index
    @users = User.all
    @book = Book.new
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
  
  def is_matching_login_user
    user_id = params[:id]
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to user_path(current_user)
    end
  end
  
  
end
