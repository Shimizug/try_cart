require "test_helper"

class CareItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get care_items_index_url
    assert_response :success
  end
end
