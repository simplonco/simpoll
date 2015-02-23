require 'test_helper'

class PollsControllerTest < ActionController::TestCase

  test "user is able to access to new form" do
    get :new
    assert_response :success
  end

  test "user is able to post new form" do
    post :create, Poll: {title: "Titre", author: "Benoit", description: "mon sondage", field: "field"}
    assert_response :success
    assert_equal 1, Poll.count
  end

end
