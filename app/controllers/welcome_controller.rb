class WelcomeController < ApplicationController
  
  def index
    @gossips = Gossip.all
    @user = params[:id]
  end

end
