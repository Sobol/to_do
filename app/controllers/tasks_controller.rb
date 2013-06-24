class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Tasks.find(params[:id])
  end

  def edit
    @task = Tasks.find(params[:id])
  end

  def create
    @task = Tasks.new(params[:task])

    if @task.save
      redirect_to @task, notice: 'Tasks was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @task = Tasks.find(params[:id])

    if @task.update_attributes(params[:task])
      redirect_to @task, notice: 'Tasks was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @task = Tasks.find(params[:id])
    @task.destroy

    redirect_to root_path
  end
end

