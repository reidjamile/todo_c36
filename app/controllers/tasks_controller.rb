# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: [:destroy]

  # GET /tasks
  def index
    @tasks = Task.all
    @task = Task.new
  end

  # GET /tasks/1
  def show; end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit; end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: 'Task was successfully created.'
    else
      redirect_to root_path, alert: @task.errors.full_messages.join(', ')
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to root_url, notice: 'Task was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:description)
  end
end