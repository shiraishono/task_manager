class TasksController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_task, only: [:destroy]

  def index
    if user_signed_in?
      @tasks = current_user.tasks.where(parent_task_id: nil)
    else
      @tasks = []
    end
  end

  def new
    @task = Task.new
    if user_signed_in?
      @tasks = current_user.tasks.where(parent_task_id: nil)
    else
      @tasks = []
    end
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to new_task_path
    else
      if user_signed_in?
        @tasks = current_user.tasks.where(parent_task_id: nil)
      else
        @tasks = []
      end
      render :new
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to delete_tasks_path
  end

  def delete
    if user_signed_in?
      @tasks = current_user.tasks.where(parent_task_id: nil)
    else
      @tasks = []
    end
  end

  def delete_selected_task
    @task = current_user.tasks.find(params[:task_id])
    @task.destroy
    redirect_to delete_tasks_path
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:text, :parent_task_id)
  end
end
