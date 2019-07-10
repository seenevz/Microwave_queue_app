class TimersController < ApplicationController
  def index
    @timers = Timer.all
    @timer = Timer.new
  end

  def create
    @microwave = Microwave.new
    @timer = current_user.timers.build(duration: timer_params[:duration], microwave: @microwave)
    if @timer.valid?
      @timer.save
      redirect_to timers_path
    else
      flash.now[:errors] = @timer.errors.full_messages
      render timers_path
    end
  end

  private

  def timer_params
    params.require(:timer).permit(:duration)
  end
end
