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
      session[:user_id] = user.id
      flash[:success] = "Bienvenue #{user.first_name}!"
      redirect_to sessions_path 
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to index_index_path
  end

end
