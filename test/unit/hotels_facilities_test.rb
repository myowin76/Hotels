require 'test_helper'

class HotelsFacilitiesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert HotelsFacilities.new.valid?
  end
end
