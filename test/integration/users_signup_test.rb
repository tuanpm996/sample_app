require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    assert_no_difference 'User.count' do
    post users_path, user: { name:  "",
                                     email: "user@invalid",
                                     password: "foo",
                                     password_confirmation: "bar" }

    end
    follow_redirect!
    assert_template 'users/new'
    assert is_logged_in?
  end

end
