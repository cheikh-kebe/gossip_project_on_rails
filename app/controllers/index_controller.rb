class IndexController < ApplicationController
  def show
    @gossips = Gossip.all
  end
end
