require 'test_helper'

class PrestationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get prestations_new_url
    assert_response :success
  end

  test "should get edit" do
    get prestations_edit_url
    assert_response :success
  end

end
