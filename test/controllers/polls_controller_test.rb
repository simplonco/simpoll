require 'test_helper'

class PollsControllerTest < ActionController::TestCase

  test "user is able to access to new form" do
    get :new
    assert_response :success
  end

  test "user is able to post new form" do
    post :create, poll: {title: "Titre", author: "Benoit", description: "mon sondage", field: "field"}
    assert_redirected_to new_poll_path
    assert_equal "Ok; sondage enregistré", flash[:notice]
    assert_equal 1, Poll.count
    assert_equal "Titre", Poll.first.title
  end

end
