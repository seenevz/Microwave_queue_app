class TimersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "timers_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
