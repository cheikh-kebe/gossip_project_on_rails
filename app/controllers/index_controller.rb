class IndexController < ApplicationController
  def index
    @gossips = Gossip.all
  end
end
