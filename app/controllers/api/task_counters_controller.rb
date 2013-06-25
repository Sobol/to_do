class Api::TaskCountersController < ApplicationController
  respond_to :json

  def index
    render json: {task_counters: {}}
  end

  def create
    task = Task.find(params[:task_id])
    counter = task.counter + params[:task_counter_modifier]
    counter = 0 if counter < 0
    task.update_attribute(:counter, counter)
    render :json => {"respond" => "ok"}
  end
end


