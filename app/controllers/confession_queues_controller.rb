class ConfessionQueuesController < ApplicationController
  before_action :set_confession_queue, only: %i[show edit update destroy]

  def index
    @confession_queues = ConfessionQueue.all
  end

  def show
  end

  def new
    @confession_queue = ConfessionQueue.new
  end

  def create
    @confession_queue = ConfessionQueue.new(confession_queue_params)
    sych_times

    if @confession_queue.save
      redirect_to confession_queues_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @confession_queue.update(confession_queue_params)

    redirect_to confession_queues_path
  end

  def destroy
    @confession_queue.destroy

    redirect_to confession_queues_path
  end

  private

  def sych_times
    @confession_queue.start_time = @confession_queue.start_time.change(year: confession_queue_params['date(1i)'].to_i,
                                                                       month: confession_queue_params['date(2i)'].to_i,
                                                                       day: confession_queue_params['date(3i)'].to_i)
    @confession_queue.end_time = @confession_queue.end_time.change(year: confession_queue_params['date(1i)'].to_i,
                                                                   month: confession_queue_params['date(2i)'].to_i,
                                                                   day: confession_queue_params['date(3i)'].to_i)
  end

  def set_confession_queue
    @confession_queue = ConfessionQueue.find(params[:id])
  end

  def confession_queue_params
    params.require(:confession_queue).permit(:date, :start_time, :end_time, :place, :notes)
  end
end
