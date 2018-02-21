class TripsController < ApplicationController
  before_action :signed_in?
  before_action :correct_user,   only: :destroy

  def index
    @trips = Trip.all
  end

  def show
    @trip = current_user.trips.find(params[:id])
  end

  def new
    @trip = current_user.trips.new
  end

  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      flash[:success] = "Trip created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @trip.destroy
    flash[:success] = "Trip deleted"
    redirect_to request.referrer || root_url
  end

  private

  def trip_params
    params.require(:trip).permit(:title)
  end

  def correct_user
    @trip = current_user.trips.find_by(id: params[:id])
    redirect_to root_url if @trip.nil?
  end


end
