require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "valid sign-up information" do
    get login_path
    assert_difference 'User.count', 1 do
    post_via_redirect users_path, user: { name: "Example",
                                          email: "example@example.com",
                                          password: "password",
                                          password_confirmation: "password"}
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
  end
