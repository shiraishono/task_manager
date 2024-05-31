class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)  # current_userメソッドが現在のログインユーザーを返すことを前提としています

    if params[:task][:parent_task_id].present?
      parent_task = Task.find_by(id: params[:task][:parent_task_id])
      @task.parent_task = parent_task if parent_task
    end

    if @task.save
      redirect_to tasks_path, notice: 'タスクが作成されました。'
    else
      render :new
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :parent_task_id)
  end
end
