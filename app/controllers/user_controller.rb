class UserController < ApplicationController
  def show
    @user = params[:id]
    @city = params[:id]
  end
end
