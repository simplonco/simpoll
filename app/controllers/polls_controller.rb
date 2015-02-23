class PollsController < ActionController::Base
  def index
    @poll = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)

    @poll.save
    redirect_to new_poll_path
  end

  private
  def poll_params
    params.require(:poll).permit(:title, :author, :description, :field)
  end
end
