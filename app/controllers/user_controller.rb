class UserController < ApplicationController
  def show
    @user = User.find(params[:id])

    @nickname = @user.nickname
    @tasks = @user.tasks
  end
end
