require 'test_helper'

class BookOfEntryControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
