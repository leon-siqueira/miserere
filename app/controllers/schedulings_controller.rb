class SchedulingsController < ApplicationController
  before_action :set_scheduling, only: %i[edit update destroy]
  before_action :set_confession_queue, only: %i[new create]

  def new
    @scheduling = Scheduling.new
  end

  def create
    @scheduling = Scheduling.new(scheduling_params)
    @scheduling.confession_queue = @confession_queue
    if @scheduling.save
      redirect_to confession_queues_path
    else
      render :new
    end
  end

  def edit
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

  def scheduling_params
    params.require(:scheduling).permit(:hour, :confession_queue_id)
  end
end
