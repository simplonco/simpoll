class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.save
    flash[:notice] = "Ok, sondage enregistré"
    redirect_to @poll
  end

  def show
    @poll = Poll.find(params[:id])
  end

  private
  def poll_params
    params.require(:poll).permit(:title, :author, :description, :field)
  end
end
