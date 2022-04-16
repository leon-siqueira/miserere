class ConfessionQueuesController < ApplicationController
  def index
    @confession_queues = ConfessionQueue.all
  end

  def show
    @confession_queue = ConfessionQueue.find(params[:id])
  end

  def new
    @confession_queue = ConfessionQueue.new
  end

  def create
    @confession_queue = ConfessionQueue.new(confession_queue_params)
    @confession_queue.save

    redirect_to confession_queues_path
  end

  private

  def confession_queue_params
    params.require(:confession_queue).permit(:date, :startTime, :endTime, :place, :notes)
  end
end
