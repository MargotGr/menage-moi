require 'test_helper'

class ColocsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get colocs_new_url
    assert_response :success
  end

end
