class WelcomeController < ApplicationController
  def show
    @gossips = params[:id]
    @user = params[:id]
  end

end
