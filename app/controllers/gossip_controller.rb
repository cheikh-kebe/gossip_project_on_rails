class GossipController < ApplicationController

  before_action :authenticate_user, only: [:show,:new]

  def index
    @id = params[:id]
    @gossips = Gossip.all
  end

  def show
    @id = params[:id]
    @gossip = find_gossip
    @comments = find_gossip.content
    @comment = Comment.new(content: params['content'], gossip_id: 1, gossip_id: @gossip ,user_id: 1)
  end

  def new
    @gossip = Gossip.new    
  end

  def create
    @gossip = Gossip.create(title: params['title'], content: params['content'], user_id: 1)
    @gossip.user = User.find_by(id: session[:user_id])
    
    if @gossip.save 
      flash[:success] = "Gossip bien créé!"
      redirect_to welcome_index_path
    else
      flash[:danger] = "Nous n'avons pas réussi à créer le potin pour la (ou les) raison(s) suivante(s) : #{@gossip.errors.full_messages.join(" , ")}"
      render new_gossip_path
    end

  end

  def edit
    @gossip = find_gossip
  end

  def update
    @gossip = find_gossip
    gossip_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to gossip_path
  end

  def destroy
    @gossip = find_gossip
    @gossip.destroy
    redirect_to welcome_index_path
  end
  
  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Veuillez vous connecter SVP!."
      redirect_to new_session_path
    end
  end

end
