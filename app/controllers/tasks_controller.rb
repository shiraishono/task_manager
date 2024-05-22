class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'タスクが作成されました。'
    else
      @tasks = Task.all
      render :index
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :parent_task_id)
  end
end
