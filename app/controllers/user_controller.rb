class UsersController < ApplicationController
  #Userモデルの定義を開始します。ApplicationRecordを継承することで、UserモデルはActive Recordの機能を利用できます。
  def show #showアクションの定義を開始します。このアクションは特定のユーザーを表示するために使用されます。
    @user = User.find(params[:id]) #URLパラメーター（params[:id]）からユーザーIDを取得し、そのIDに対応するユーザーをデータベースから検索します。
    #検索結果はインスタンス変数@userに格納されます。
    @nickname = @user.nickname #検索したユーザーのニックネームをインスタンス変数@nicknameに格納します。
    @tasks = @user.tasks #検索したユーザーが所有するタスクをすべて取得し、インスタンス変数@tasksに格納します。
  end
end
