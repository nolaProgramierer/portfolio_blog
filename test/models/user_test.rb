require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                    password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = '  '
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = '    '
    assert_not @user.valid?
  end

  test "name should have minimum length" do
    @user.name = 'ex'
    assert_not @user.valid?
  end

  test "valid email address" do
    valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "invalid email addresses should be rejected" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} isn't valid"
    end
  end

  test "should have unique email" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password has minimum length" do
    @user.password = @user.password_confirmation = "passw"
    assert_not @user.valid?
  end
end
