require 'test_helper'

class FacilityTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Facility.new.valid?
  end
end
