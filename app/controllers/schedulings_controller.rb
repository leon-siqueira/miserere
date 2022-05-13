class SchedulingsController < ApplicationController
  before_action :set_scheduling, only: %i[edit update destroy]
  before_action :set_confession_queue, only: %i[new create]

  def new
    @scheduling = Scheduling.new
    @scheduling_slots = scheduling_availability(@confession_queue)
  end

  def create
    @scheduling = Scheduling.new(scheduling_params)
    @scheduling.confession_queue = @confession_queue
    if @scheduling.save
      redirect_to confession_queues_path
    else
      @scheduling_slots = scheduling_availability(@confession_queue)
      render :new
    end
  end

  def edit
    @scheduling_slots = scheduling_availability(@scheduling.confession_queue)
  end

  def update
    @scheduling.update(scheduling_params)

    redirect_to confession_queues_path
  end

  def destroy
    @scheduling.destroy

    redirect_to confession_queues_path
  end

  private

  def set_scheduling
    @scheduling = Scheduling.find(params[:id])
  end

  def set_confession_queue
    @confession_queue = ConfessionQueue.find(params[:confession_queue_id])
  end

  def scheduling_availability(confession_queue)
    scheduling_availability = {}
    minute_step = confession_queue.start_time
    until scheduling_availability.keys.include?(confession_queue.end_time.strftime('%R'))
      scheduling_availability[minute_step.strftime('%R')] = !confession_queue.schedulings.map(&:hour)
                                                                             .include?(minute_step.strftime('%R'))
      minute_step += 15.minutes
    end

    scheduling_availability
  end

  def scheduling_params
    params.require(:scheduling).permit(:hour, :confession_queue_id)
  end
end
