require 'test_helper'

class HotelTypesControllerTest < ActionController::TestCase
  setup do
    @hotel_type = hotel_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotel_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel_type" do
    assert_difference('HotelType.count') do
      post :create, :hotel_type => @hotel_type.attributes
    end

    assert_redirected_to hotel_type_path(assigns(:hotel_type))
  end

  test "should show hotel_type" do
    get :show, :id => @hotel_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hotel_type.to_param
    assert_response :success
  end

  test "should update hotel_type" do
    put :update, :id => @hotel_type.to_param, :hotel_type => @hotel_type.attributes
    assert_redirected_to hotel_type_path(assigns(:hotel_type))
  end

  test "should destroy hotel_type" do
    assert_difference('HotelType.count', -1) do
      delete :destroy, :id => @hotel_type.to_param
    end

    assert_redirected_to hotel_types_path
  end
end
