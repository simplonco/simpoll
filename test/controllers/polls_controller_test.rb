require 'test_helper'

class PollsControllerTest < ActionController::TestCase

  test "user is able to access to new form" do
    get :new
    assert_response :success
  end

  test "user can access all polls" do
    poll = Fabricate(:poll)
    get :index
    assert_response :success
    assert_equal([poll], assigns(:polls))
  end

  test "user is able to post new form" do
    post :create, poll:
      { title: "Titre",
        author: "Benoit",
        description: "mon sondage",
        field: "field" }
    assert_redirected_to poll_path(Poll.first)
    assert_equal "Ok, sondage enregistré", flash[:notice]
    assert_equal 1, Poll.count
    assert_equal "Titre", Poll.first.title
  end

end
