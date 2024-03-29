require 'test_helper'

class ReleasesControllerTest < ActionController::TestCase
  setup do
    @release = releases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:releases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create release" do
    assert_difference('Release.count') do
      post :create, release: { book_id: @release.book_id, location: @release.location }
    end

    assert_redirected_to release_path(assigns(:release))
  end

  test "should show release" do
    get :show, id: @release
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @release
    assert_response :success
  end

  test "should update release" do
    put :update, id: @release, release: { book_id: @release.book_id, location: @release.location }
    assert_redirected_to release_path(assigns(:release))
  end

  test "should destroy release" do
    assert_difference('Release.count', -1) do
      delete :destroy, id: @release
    end

    assert_redirected_to releases_path
  end
end
