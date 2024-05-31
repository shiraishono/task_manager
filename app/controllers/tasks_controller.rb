class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.where(parent_task_id: nil)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'タスクが作成されました。'
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :parent_task_id)
  end
end
