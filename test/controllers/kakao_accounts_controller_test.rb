require 'test_helper'

class KakaoAccountsControllerTest < ActionController::TestCase
  setup do
    @kakao_account = kakao_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kakao_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kakao_account" do
    assert_difference('KakaoAccount.count') do
      post :create, kakao_account: {  }
    end

    assert_redirected_to kakao_account_path(assigns(:kakao_account))
  end

  test "should show kakao_account" do
    get :show, id: @kakao_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kakao_account
    assert_response :success
  end

  test "should update kakao_account" do
    patch :update, id: @kakao_account, kakao_account: {  }
    assert_redirected_to kakao_account_path(assigns(:kakao_account))
  end

  test "should destroy kakao_account" do
    assert_difference('KakaoAccount.count', -1) do
      delete :destroy, id: @kakao_account
    end

    assert_redirected_to kakao_accounts_path
  end
end
