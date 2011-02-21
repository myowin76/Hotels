require 'test_helper'

class FacilitiesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Facility.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Facility.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Facility.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to facility_url(assigns(:facility))
  end

  def test_edit
    get :edit, :id => Facility.first
    assert_template 'edit'
  end

  def test_update_invalid
    Facility.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Facility.first
    assert_template 'edit'
  end

  def test_update_valid
    Facility.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Facility.first
    assert_redirected_to facility_url(assigns(:facility))
  end

  def test_destroy
    facility = Facility.first
    delete :destroy, :id => facility
    assert_redirected_to facilities_url
    assert !Facility.exists?(facility.id)
  end
end
