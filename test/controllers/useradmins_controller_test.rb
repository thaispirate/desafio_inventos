require 'test_helper'

class UseradminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @useradmin = useradmins(:one)
  end

  test "should get index" do
    get useradmins_url
    assert_response :success
  end

  test "should get new" do
    get new_useradmin_url
    assert_response :success
  end

  test "should create useradmin" do
    assert_difference('Useradmin.count') do
      post useradmins_url, params: { useradmin: { email: @useradmin.email, name: @useradmin.name } }
    end

    assert_redirected_to useradmin_url(Useradmin.last)
  end

  test "should show useradmin" do
    get useradmin_url(@useradmin)
    assert_response :success
  end

  test "should get edit" do
    get edit_useradmin_url(@useradmin)
    assert_response :success
  end

  test "should update useradmin" do
    patch useradmin_url(@useradmin), params: { useradmin: { email: @useradmin.email, name: @useradmin.name } }
    assert_redirected_to useradmin_url(@useradmin)
  end

  test "should destroy useradmin" do
    assert_difference('Useradmin.count', -1) do
      delete useradmin_url(@useradmin)
    end

    assert_redirected_to useradmins_url
  end
end
