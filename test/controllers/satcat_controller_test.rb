require "test_helper"

class SatcatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get satcat_index_url
    assert_response :success
  end

  test "should get noradcatid" do
    get satcat_noradcatid_url
    assert_response :success
  end

  test "should get launch" do
    get satcat_launch_url
    assert_response :success
  end

  test "should get constellations" do
    get satcat_constellations_url
    assert_response :success
  end
end
