class UserController < ApplicationController
  def show
    @user = params[:id]
  end
end
