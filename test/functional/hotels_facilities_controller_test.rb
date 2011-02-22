require 'test_helper'

class HotelsFacilitiesControllerTest < ActionController::TestCase
  setup do
    @hotels_facility = hotels_facilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotels_facilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotels_facility" do
    assert_difference('HotelsFacility.count') do
      post :create, :hotels_facility => @hotels_facility.attributes
    end

    assert_redirected_to hotels_facility_path(assigns(:hotels_facility))
  end

  test "should show hotels_facility" do
    get :show, :id => @hotels_facility.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hotels_facility.to_param
    assert_response :success
  end

  test "should update hotels_facility" do
    put :update, :id => @hotels_facility.to_param, :hotels_facility => @hotels_facility.attributes
    assert_redirected_to hotels_facility_path(assigns(:hotels_facility))
  end

  test "should destroy hotels_facility" do
    assert_difference('HotelsFacility.count', -1) do
      delete :destroy, :id => @hotels_facility.to_param
    end

    assert_redirected_to hotels_facilities_path
  end
end
