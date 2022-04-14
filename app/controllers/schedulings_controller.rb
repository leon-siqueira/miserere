class SchedulingsController < ApplicationController
  def new
    @confession_queue = ConfessionQueue.find(params[:confession_queue_id])
    @scheduling = Scheduling.new
  end
end
