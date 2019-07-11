class TimersController < ApplicationController
  def index
    @timers = Timer.all
    @timer = Timer.new
    timers = Timer.all.map { |timer| { username: timer.user.username, timer: timer } }
    respond_to do |f|
      f.html
      f.json do render json: timers end
    end
  end

  def create
    @microwave = Microwave.new
    @timer = current_user.timers.build(duration: timer_params[:duration], microwave: @microwave)
    if @timer.valid?
      @timer.save
      timers = Timer.all.map { |timer| { username: timer.user.username, timer: timer } }
      ActionCable.server.broadcast("timers_channel", timers)
      # redirect_to timers_path
    else
      flash.now[:errors] = @timer.errors.full_messages
      render timers_path
    end
  end

  def destroy
    @timer = Timer.find(params[:id])
    @timer.destroy
    timers = Timer.all.map { |timer| { username: timer.user.username, timer: timer } }
    ActionCable.server.broadcast("timers_channel", timers)
  end

  private

  def timer_params
    params.require(:timer).permit(:id, :duration)
  end
end
