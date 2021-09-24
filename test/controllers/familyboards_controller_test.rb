require 'test_helper'

class FamilyboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get familyboards_new_url
    assert_response :success
  end

end
