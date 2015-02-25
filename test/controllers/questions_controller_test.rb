require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  test "test new" do
    poll = Fabricate(:poll)
    get :new, poll_id: poll.id
    assert_response :success
    assert_equal(poll, assigns(:poll))
  end

end
