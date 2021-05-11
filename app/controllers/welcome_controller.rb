class WelcomeController < ApplicationController
  def show
    @gossips = Gossip.all
    @user = params[:id]
  end

end
