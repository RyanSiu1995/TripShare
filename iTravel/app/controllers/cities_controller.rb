class CitiesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
  end

  # the new action
  def new
    @trip = Trip.find(params[:id])
    @city = @trip.cities.new
  end

  def show

  end

  def create
    # debugger
    trip_id = params[:city][:trip_id]
    @trip = Trip.find(trip_id)
    @city = @trip.cities.build(city_params)
    respond_to do |format|

      if @city.save
        flash[:success] = "City created!"
        format.html { redirect_to @trip, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
    @city = City.find(params[:id])
  end


  def update
    # Check the updated flag
    if @city.update_attributes(city_params)
      flash[:success] = "City updated"
      redirect_to @city
    else
      render 'edit'
    end

  end

  def destroy
    # Distroy the city
    @city.destroy
    flash[:success] = "City deleted"
    redirect_to request.referrer || root_url
  end

  private

  def city_params
    params.require(:city).permit(:name, :description)
  end

  #TODO - fix (probably by sending the trip id and city id)
  def correct_user
    # @trip = current_user.trips.find_by(id: params[:id])
    # redirect_to root_url if @trip.nil?

    # @trip = current_user.trips.find_by(id: params[:id])
    # # @trips = @user.trips.all
    # @city = @trip.cities.find_by(id: params[:id])
    # redirect_to root_url if @city.nil?
  end

end
