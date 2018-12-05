require 'test_helper'

class PlanningsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get plannings_index_url
    assert_response :success
  end

end
