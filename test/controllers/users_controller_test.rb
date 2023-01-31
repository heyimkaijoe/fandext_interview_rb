require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "get new user page" do
    get new_user_path
    assert_template :new
  end

  test "create user succeeded" do
    post users_path, params: {user: {email: 'kevin3117213@gmail.com', first_name: 'KAI CHIEH', last_name: 'HSU', address: '南京西路十段'}}
    assert_redirected_to users_path
    assert_equal 'Welcome to fandnext', flash[:success]
  end

  test "create user failed" do
    post users_path, params: {user: {email: 'invalid_email', first_name: 'John', last_name: 'Doe', address: '123 Easy St'}}
    assert_template :new
    assert_equal 'Domain invalid', flash[:warning]
  end
end
