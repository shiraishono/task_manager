#TasksControllerクラスを定義し、ApplicationControllerクラスを継承します。
class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
#index、new、およびcreateアクションを実行する前にauthenticate_user!メソッドを呼び出します。
#このメソッドは、Deviseなどの認証システムを使用してユーザーがログインしているか確認します。

  def index #indexアクションを定義する。このアクションは、タスクの一覧を表示します。
    @tasks = Task.all #全てのタスクをデータベースから取得し、インスタンス変数@tasksに格納します。この変数はビューで使用されます。
    @task = Task.new #新しいタスクのインスタンスを作成し、インスタンス変数@taskに格納します。ビューで新しいタスクを作成するフォームを表示できます。
  end

  def create #createアクションを定義します。このアクションは、新しいタスクを作成するために使用されます。
    @task = current_user.tasks.build(task_params)
    #現在ログインしているユーザーに関連付けられた新しいタスクのインスタンスを作成し、task_paramsメソッドから取得したパラメータを使用して初期化します。
    if @task.save #タスクの保存を試み、成功したかどうかをチェックします。
      redirect_to tasks_path,notice: 'タスクが正常に作成されました。'#タスクが正常に保存された場合、タスク一覧ページにリダイレクトします。
    else #タスクの保存に失敗した場合の処理を開始します。
      @tasks = Task.all #再度全てのタスクを取得し、インスタンス変数@tasksに格納します。これにより、エラーメッセージと共にタスク一覧が表示されます。
      render :index #indexテンプレートをレンダリングし、エラーメッセージを表示します。
    end
  end

  private #ここから下に定義されるメソッドは、コントローラの外部からはアクセスできないようにします。

  def task_params #task_paramsメソッドを定義します。このメソッドは、許可されたパラメータのみを取得するために使用されます。
    params.require(:task).permit(:title, :parent_task_id)
    #paramsオブジェクトから、taskキーの値を取得し、titleおよびparent_task_idフィールドのみを許可します。これにより、セキュリティが向上します。
  end
end
