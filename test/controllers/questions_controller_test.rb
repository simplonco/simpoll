require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  test "new" do
    poll = Fabricate(:poll)
    get :new, poll_id: poll.id
    assert_response :success
    assert_equal(poll, assigns(:poll))
  end

  test "create" do
    poll = Fabricate(:poll)
    
    assert_equal(0, poll.questions.length)

    post :create, poll_id: poll.id, 
	question: 
		{
		 content: "blabla",
		 choices_attributes: {"0" => {value: "test"}}
		}
    
    assert_redirected_to poll_path(poll)

    assert_equal(1, poll.reload.questions.length)

    assert_equal("blabla", poll.questions.first.content)
    assert_equal(1, poll.questions.first.choices.length)


  end

end
