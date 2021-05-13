class UserController < ApplicationController
  def show
    @user = params[:id]
    @city = params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new()

    user_params = params.permit(:first_name, :last_name, :email, :age, :city_id, :password, :description)
    @user = User.new(user_params)
    
    if @user.save 
      flash[:success] = "Utilisateur créé!"
      redirect_to welcome_index_path
    else
      flash[:danger] = "Nous n'avons pas réussi à créer d'utilisateur pour la (ou les) raison(s) suivante(s) : #{@user.errors.full_messages.join(" , ")}"
      render new_user_path
    end

  end
end
