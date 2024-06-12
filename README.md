## アプリケーション名
  TASK MANAGER

## アプリケーション概要
  TASK MANAGERは、ユーザーがタスクを管理できるアプリケーションです。

## URL
  https://task-manager-orsp.onrender.com/

## テスト用アカウント
- Basic認証ID：admin
- Basic認証パスワード：2222
- メールアドレス：task@email
- パスワード：task1111

## 利用方法

### ①Sign upページにて必要情報を入力しアカウントを作成する
[![Image from Gyazo](https://i.gyazo.com/09cbdaf4b6bffa3679e9088dcf21a301.gif)](https://gyazo.com/09cbdaf4b6bffa3679e9088dcf21a301)

### ②Log inページにてログインしタスクリストページにアクセスする
[![Image from Gyazo](https://i.gyazo.com/9483b2b4fe2f889dc64ecd65497b7c50.gif)](https://gyazo.com/9483b2b4fe2f889dc64ecd65497b7c50)

### ③タスク追加ページにてタスクを作成する


## データベース設計

### usersテーブル（ユーザー管理機能）

  | Column             | Type   | Options                   |
  | ------------------ | ------ | ------------------------- |
  | nickname           | string | null: false               |
  | email              | string | null: false, unique: true |
  | encrypted_password | string | null: false               |

#### Association
- has_many :tasks, dependent: :destroy

### tasksテーブル（タスク管理機能）

  | Column               | Type       | Options                         |
  | -------------------- | ---------- | ------------------------------- |
  | text                 | string     | null: false                     |
  | user_id              | references | null: false, foreign_key:true   |
  | parent_task_id       | references | foreign_key:{ to_table::tasks } |

#### Association
- belongs_to :user
- has_many :sub_tasks, class_name: "Task", foreign_key: "parent_task_id", dependent: :destroy
- belongs_to :parent_task, class_name: "Task", optional: true

## ER図
  [![Image from Gyazo](https://i.gyazo.com/7642fbe58ac77c573fa95e9ea3727c81.png)](https://gyazo.com/7642fbe58ac77c573fa95e9ea3727c81)

## 画面遷移図
  [![Image from Gyazo](https://i.gyazo.com/ce1583eaf87b34ea21a832622cf475a2.png)](https://gyazo.com/ce1583eaf87b34ea21a832622cf475a2)