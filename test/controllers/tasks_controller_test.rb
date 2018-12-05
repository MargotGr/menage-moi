require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get initial" do
    get tasks_initial_url
    assert_response :success
  end

end
