module ApplicationHelper
  def poll_title(poll)
    "#{poll.title} - #{poll.author}"
  end
end
