class TasksController < ApplicationController
  def index
    @tasks = Task.order(:position) 
  end

  def show
    @task = Task.find(params[:id])
  end

  # The new and create actions of the create part of CRUD work together 
  # by having the new action display a web form that a user can fill out and submit to the create action
  def new
    @count = Task.count
    @task = Task.new(position: @count +1)
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      # The 'new' action is NOT being called here
      # Assign any instance variables needed
      # @count = Task.count
      render('new')
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render('edit')
    end
  end

  # Delete displays a delete record form, and destroy would actually do the destruction of the database record.
  def delete
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(
      :name,
      :position,
      :completed,
      :description
    )
  end
end
