class PicturesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
  end

  def new
    @trip = Trip.find(params[:id])
    @picture = @trip.pictures.new
  end

  def show

  end

  def create
    # debugger
    trip_id = params[:picture][:trip_id]
    @trip = Trip.find(trip_id)
    @picture = @trip.pictures.build(picture_params)
    respond_to do |format|

      if @picture.save
        flash[:success] = "Picture created!"
        format.html { redirect_to @trip, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
    @picture = Picture.find(params[:id])
  end


  def update
    if @picture.update_attributes(picture_params)
      flash[:success] = "Picture updated"
      redirect_to @picture
    else
      render 'edit'
    end

  end

  def destroy
    @picture.destroy
    flash[:success] = "Picture deleted"
    redirect_to request.referrer || root_url
  end

  private

  def picture_params
    params.require(:picture).permit(:image)
  end

  #TODO - fix (probably by sending the trip id and picture id)
  def correct_user
    # @trip = current_user.trips.find_by(id: params[:id])
    # redirect_to root_url if @trip.nil?

    # @trip = current_user.trips.find_by(id: params[:id])
    # # @trips = @user.trips.all
    # @picture = @trip.pictures.find_by(id: params[:id])
    # redirect_to root_url if @picture.nil?
  end

end
