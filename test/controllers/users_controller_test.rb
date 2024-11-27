class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get new_user_url
    assert_response :success
  end

  test "should create and delete user" do
    assert_not User.exists? email_address: "mette@ft.dk"

    get new_user_url
    assert_response :success

    post user_url, params: { user: { email_address: "mette@ft.dk", password: "hunter2" } }
    assert_response :redirect

    assert User.exists? email_address: "mette@ft.dk"

    delete user_url
    assert_response :redirect

    assert_not User.exists? email_address: "mette@ft.dk"
  end
end
