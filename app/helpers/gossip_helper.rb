module GossipHelper

  def find_gossip
    Gossip.find(params[:id])
  end
end
