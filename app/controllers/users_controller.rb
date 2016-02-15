class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])

  end

  def new
  @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user #after signs up, logs in
    #handle a successful save.
    flash[:success] = "welcome to the sample app!" #renders on the output page
    redirect_to @user #rails infers the url and the user id
    else
    render 'new'
    end
  end

  private
    def user_params  #strong parameters
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end


end
