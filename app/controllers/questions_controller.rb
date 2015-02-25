class QuestionsController < ApplicationController
  
  def new
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.new
    @question.choices.build
  end

  def create
  	poll = Poll.find(params[:poll_id])

  	question = poll.questions.new
  	question.update_attributes(question_params)
  	question.save

  	redirect_to poll_path(poll)
  end

	private

	def question_params
		params.require(:question).permit(:content, choices_attributes: [:value])
	end

end


