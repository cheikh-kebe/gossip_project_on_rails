class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @gossips = Gossip.all
  end

  def create
    user = User.find_by(email: params['email'])

    if user && user.authenticate(params['password_digest'])
      log_in(user)
      remember(user)
      flash[:success] = "Bienvenue #{user.first_name}!"
      redirect_to sessions_path 
    else
      flash.now[:danger] = 'Combinaison Email/Mot de passe Invalide, Réessayer'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to index_index_path
  end

end
