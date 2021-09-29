class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice:"You have updated user successfully."
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction)
  end
end
