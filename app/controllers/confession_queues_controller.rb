class ConfessionQueuesController < ApplicationController
  def new
    @confession_queue = ConfessionQueue.new()
  end
end
