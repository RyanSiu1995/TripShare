require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
      password: "foobar", password_confirmation: "foobar")
    end


    test "associated trips should be destroyed" do
      @user.save
      @user.trips.create!(title: "Lorem ipsum")
      assert_difference 'Trip.count', -1 do
        @user.destroy
      end
    end
  end
