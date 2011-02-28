require 'test_helper'

class HotelsRoomtypesControllerTest < ActionController::TestCase
  setup do
    @hotels_roomtype = hotels_roomtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotels_roomtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotels_roomtype" do
    assert_difference('HotelsRoomtype.count') do
      post :create, :hotels_roomtype => @hotels_roomtype.attributes
    end

    assert_redirected_to hotels_roomtype_path(assigns(:hotels_roomtype))
  end

  test "should show hotels_roomtype" do
    get :show, :id => @hotels_roomtype.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hotels_roomtype.to_param
    assert_response :success
  end

  test "should update hotels_roomtype" do
    put :update, :id => @hotels_roomtype.to_param, :hotels_roomtype => @hotels_roomtype.attributes
    assert_redirected_to hotels_roomtype_path(assigns(:hotels_roomtype))
  end

  test "should destroy hotels_roomtype" do
    assert_difference('HotelsRoomtype.count', -1) do
      delete :destroy, :id => @hotels_roomtype.to_param
    end

    assert_redirected_to hotels_roomtypes_path
  end
end
