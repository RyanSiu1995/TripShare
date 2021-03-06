class TripsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :like]
  before_action :correct_user,   only: [:edit, :update]

  def index
    # @trips = Trip.all.sort_by(&:cached_votes_total).reverse
    if params[:search]
      @trips = Trip.search(params[:search]).order("created_at DESC")
    else
      @trips = Trip.all.order('created_at DESC')
    end
  end

  # GET /users/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  def show
    # Bind the variables from the trip object
    @trip = Trip.find(params[:id])
    @cities = @trip.cities.all
    @pictures = @trip.pictures.all
    @comments = @trip.comments.all
    @comment = @trip.comments.new

  end

  def new
    @trip = current_user.trips.new
  end

  def create
    @trip = current_user.trips.build(trip_params)
    respond_to do |format|

      if @trip.save
        # flash[:success] = "Trip created!"
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # Check if it is updated
    if @trip.update_attributes(trip_params)
      flash[:success] = "Trip updated"
      redirect_to @trip
    else
      render 'edit'
    end
  end

  def like
    @trip = Trip.find(params[:id])

    if current_user.liked? @trip
      @trip.unliked_by current_user
    else
      @trip.liked_by current_user
    end

    redirect_to trip_path

  end


  def destroy
    @trip.destroy
    flash[:success] = "Trip deleted"
    redirect_to request.referrer || root_url
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :start_date, :finish_date, :country)
  end

  def correct_user
    @trip = current_user.trips.find_by(id: params[:id])
    redirect_to root_url if @trip.nil?
  end


end
