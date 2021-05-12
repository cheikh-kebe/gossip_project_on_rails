class GossipController < ApplicationController

  def index
    @id = params[:id]
    @gossips = Gossip.all
  end

  def show
    @id = params[:id]
    @gossip = Gossip.find(params[:id])
    @comments = Gossip.find(params[:id]).content
    @comment = Comment.new(content: params['content'], gossip_id: 1, gossip_id: @gossip ,user_id: 1)
  end

  def new
    @gossip = Gossip.new    
  end

  def create
    @gossip = Gossip.create(title: params['title'], content: params['content'], user_id: 1)

    if @gossip.save 
      flash[:success] = "Gossip bien créé!"
      redirect_to welcome_index_path
    else
      flash[:danger] = "Nous n'avons pas réussi à créer le potin pour la (ou les) raison(s) suivante(s) : #{@gossip.errors.full_messages.join(" , ")}"
      render new_gossip_path
    end

  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to gossip_path
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to welcome_index_path
  end

end
