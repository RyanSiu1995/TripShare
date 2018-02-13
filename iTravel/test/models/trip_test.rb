require 'test_helper'

class TripTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)

    @trip = @user.trips.build(title: "Lorem ipsum")

  end

  test "should be valid" do
    assert @trip.valid?
  end

  test "user id should be present" do
    @trip.user_id = nil
    assert_not @trip.valid?
  end

  test "title should be present" do
    @trip.title = "   "
    assert_not @trip.valid?
  end

  test "order should be most recent first" do
    assert_equal trips(:most_recent), Trip.first
  end

end
