class StaticPagesController < ApplicationController
  def home
    number_of_trips =  Trip.all.size
    top_number = 15
    @trips = Trip.all.sort_by(&:cached_weighted_score).reverse
    @top_trips = @trips.first(top_number)
  end

  def my_trips
  end

  def explore
  end
end
