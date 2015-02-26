require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  attr_reader :poll

  def setup
    @poll = Fabricate(:poll)
  end

  test "new" do
    get :new, poll_id: poll.id
    assert_response :success
    assert_equal(poll, assigns(:poll))
    assert_kind_of(Question, assigns(:question))
    assert_equal(1, assigns(:question).choices.length)
  end
  
  test "add new choice" do
    get :new, poll_id: poll.id, number_of_choices: 2
    assert_equal(2, assigns(:question).choices.length)
  end
  
  test "create" do
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

  test "Delete a question" do
    question = Fabricate(:question, poll: poll)
    post :destroy, poll_id: poll.id, id: question.id  
    assert_redirected_to poll_path(poll)
    assert_equal 0, Question.count
  end
end