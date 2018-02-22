class TripsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @trips = Trip.all
  end

  def show
    # @user = User.find(params[:id])
    @trip = current_user.trips.find_by(id: params[:id])
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

  def update
    if @trip.update_attributes(trip_params)
      flash[:success] = "Trip updated"
      redirect_to @trip
    else
      render 'edit'
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
