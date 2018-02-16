require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get contacts" do
    get search_contacts_url
    assert_response :success
  end

end
