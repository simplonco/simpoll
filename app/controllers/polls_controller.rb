class PollsController < ApplicationController
  def index
    @poll = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.save
    flash[:notice] = "Ok; sondage enregistré"
    redirect_to new_poll_path
  end

  private
  def poll_params
    params.require(:poll).permit(:title, :author, :description, :field)
  end
end
