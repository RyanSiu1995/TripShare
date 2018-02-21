class TripsController < ApplicationController
  before_action :signed_in?

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def create
    @trip = current_user.trips.build(micropost_params)
    if @trip.save
      flash[:success] = "Trip created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

  def micropost_params
    params.require(:trip).permit(:title)
  end

end
