class SchedulingsController < ApplicationController
  def new
    @confession_queue = ConfessionQueue.find(params[:confession_queue_id])
    @scheduling = Scheduling.new
  end

  def create
    @confession_queue = ConfessionQueue.find(params[:confession_queue_id])
    @scheduling = Scheduling.new(scheduling_params)
    @scheduling.confession_queue = @confession_queue
    if @scheduling.save
      redirect_to confession_queues_path
    else
      render :new
    end
  end



  def scheduling_params
    params.require(:scheduling).permit(:hour, :confession_queue_id)
  end
end
