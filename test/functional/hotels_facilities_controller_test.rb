require 'test_helper'

class HotelsFacilitiesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => HotelsFacilities.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    HotelsFacilities.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    HotelsFacilities.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to hotels_facilities_url(assigns(:hotels_facilities))
  end

  def test_edit
    get :edit, :id => HotelsFacilities.first
    assert_template 'edit'
  end

  def test_update_invalid
    HotelsFacilities.any_instance.stubs(:valid?).returns(false)
    put :update, :id => HotelsFacilities.first
    assert_template 'edit'
  end

  def test_update_valid
    HotelsFacilities.any_instance.stubs(:valid?).returns(true)
    put :update, :id => HotelsFacilities.first
    assert_redirected_to hotels_facilities_url(assigns(:hotels_facilities))
  end

  def test_destroy
    hotels_facilities = HotelsFacilities.first
    delete :destroy, :id => hotels_facilities
    assert_redirected_to hotels_facilities_url
    assert !HotelsFacilities.exists?(hotels_facilities.id)
  end
end
