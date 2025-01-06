class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get new_user_url
    assert_response :success
  end

  test "should create and verify user" do
    assert_not User.exists? email_address: "mette@ft.dk"

    get new_user_url
    assert_response :success

    assert_emails 1 do
      post user_url, params: { user: { email_address: "mette@ft.dk", password: "hunter2" } }
      assert_response :redirect
    end

    user = User.find_by(email_address: "mette@ft.dk")
    assert_not user.verified?

    links = URI.extract(ActionMailer::Base.deliveries.last.text_part.body.to_s, /https?/)
    link_path = URI.parse(links.first).path

    get link_path
    assert_response :success
    patch link_path
    assert_response :redirect

    user.reload
    assert User.find_by(email_address: "mette@ft.dk").verified?
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
