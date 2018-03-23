class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:new, :create, :destroy]


  def new
    @trip = Trip.find(params[:id])
    @comment = @trip.comments.new

  end

  def create

    trip_id = params[:comment][:trip_id]
    @trip = Trip.find(trip_id)
    @comment = @trip.comments.build(comment_params)
    respond_to do |format|

      if @comment.save
        flash[:success] = "Comment created!"
        format.html { redirect_to @trip, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url

  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end


end
