class GossipController < ApplicationController
  def show
    @gossip = params[:id]
  end
end
