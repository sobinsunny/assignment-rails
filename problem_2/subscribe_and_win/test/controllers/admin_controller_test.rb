require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test 'should get dashbord' do
    get admin_dashbord_url
    assert_response :success
  end
end
