class CityController < ApplicationController
  def index
  end

  def show
    @city = City.find(params[:id])
    @gossips = Gossip.where(user_id:User.where(city_id:@city.id))
  end

  def new
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end
end
