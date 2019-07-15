class MicrowaveTimerOneJob < ApplicationJob
  queue_as :default

  def perform(time:)
    binding.pry
    timer_in_secs = (time * 60)
    sleep(timer_in_secs)
    ActionCable.server.broadcast("timers_channel", "I'm finished")
  end
end
