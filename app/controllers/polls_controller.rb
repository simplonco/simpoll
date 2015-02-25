class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def create
    poll = Poll.new(poll_params)
    poll.save
    flash[:notice] = "Sondage créé : vous pouvez maintenant créer vos questions."
    redirect_to new_poll_question_path(poll)
  end

  def show
    @poll = Poll.find(params[:id])
  end

  private
  def poll_params
    params.require(:poll).permit(:title, :author, :description, :field)
  end
end
