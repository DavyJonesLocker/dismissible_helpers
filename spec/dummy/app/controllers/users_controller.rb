class UsersController < ApplicationController
  def create
    User.create(user_params)
  end

  private

  def user_params
    params.required(:user).permit(:dismissed_helpers, :email)
  end
end
