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

### ①Sign upページで必要情報を入力しアカウントを作成する
[![Image from Gyazo](https://i.gyazo.com/09cbdaf4b6bffa3679e9088dcf21a301.gif)](https://gyazo.com/09cbdaf4b6bffa3679e9088dcf21a301)

### ②Log inページでログインしタスクリストページにアクセスする
[![Image from Gyazo](https://i.gyazo.com/9483b2b4fe2f889dc64ecd65497b7c50.gif)](https://gyazo.com/9483b2b4fe2f889dc64ecd65497b7c50)

### ③タスク追加ページにてタスクを作成する
[![Image from Gyazo](https://i.gyazo.com/914c35052407b93bd9fe291d74ea8259.gif)](https://gyazo.com/914c35052407b93bd9fe291d74ea8259)

### ④任意のタスクに新たにタスクを追加する
[![Image from Gyazo](https://i.gyazo.com/48a3aee034ad2e016763a934104e9459.gif)](https://gyazo.com/48a3aee034ad2e016763a934104e9459)

### ⑤タスク消去ページにて完了したタスクを消去する
[![Image from Gyazo](https://i.gyazo.com/d3dbe731340f252f164b1c5c19c97c25.gif)](https://gyazo.com/d3dbe731340f252f164b1c5c19c97c25)

## アプリケーションを作成した背景
複数のタスクやプロジェクトを一元管理し、効率的に進行状況を把握したいと考えました。
そのため、タスクを階層構造で整理し、視覚的に一見で管理する事で、タスクやプロジェクト全体の見通しを良くしました。

## 工夫したポイント
- 世の中に無い新たな機能を搭載したアプリケーションにこだわり作成しました
- 階層的に管理できるようにすることで、複雑なタスクやプロジェクトも視覚的に整理しやすくしました
- 親しみやすいデザインや簡単な操作を実装する事で、ユーザーライクを目指しました

## 苦労したポイント
- ロジックツリーを用いた新たな機能を搭載したアプリケーションのため、参考になる情報が少なく苦労しました
- 階層的に表示するためのコード作成に苦労しました
- 様々なエラーの解消に苦労しました

## 実装予定の機能
- テストコードを実装します
- タスク編集機能を実装します
- 操作手順を実装します
- 完了したタスクの横にチェックマークを実装します
- 時間管理機能を実装します
- タスクの並べ替え機能を実装します
- タスク表示の省略機能を実装します
- 各タスクへコメント機能を実装します
- 各ユーザ間へシェア機能を実装します
- 動的に編集できる機能を実装します
- お問い合わせフォームを実装します
- ロジックツリーの他にガントチャートや看板ボードのような他の表示に切り替え出来る機能を実装します

## 企画・要件定義
https://docs.google.com/spreadsheets/d/1Ewr7T5CaBdYRAy3Aq9L16BmgL0op7CUol4gDfQ0hQWA/edit?usp=sharing

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

## 開発環境
- os：linux (ubuntu)
- フロントエンド：HTML/CSS・JavaScript
- バックエンド：Rails 7.0.8.1
- インフラ：Render.com