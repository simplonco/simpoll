class QuestionsController < ApplicationController

  before_filter :find_poll

  def new
    @question = @poll.questions.new
  end

  def create
  	question = @poll.questions.new
  	question.update_attributes(question_params)
  	question.save
  	redirect_to poll_path(@poll)
  end

  def edit
    @question = @poll.questions.find(params[:id])
  end

  def update
    question = @poll.questions.find(params[:id])
    question.choices.delete_all
    question.update_attributes(question_params)
    question.save
    redirect_to poll_path(@poll)
  end

  def destroy
    question = @poll.questions.find(params[:id])
    question.delete
    redirect_to poll_path(@poll)
  end

	private

	def question_params
		params.require(:question).permit(:content, choices_attributes: [:value, :_destroy])
	end

  def find_poll
    @poll = Poll.find(params[:poll_id])
  end
end
