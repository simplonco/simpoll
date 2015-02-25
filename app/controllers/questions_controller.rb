class QuestionsController < ApplicationController
  def new
    @poll = Poll.find(params[:poll_id])
  end

  def create
  	poll = Poll.find(params[:poll_id])
  	redirect_to poll_path(poll)
  end
end
