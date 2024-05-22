# データベース設計

## usersテーブル（ユーザー管理機能）

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |

### Association
- has_many :tasks

## tasksテーブル（タスク管理機能）

| Column               | Type       | Options                         |
| -------------------- | ---------- | ------------------------------- |
| title                | string     | null: false                     |
| user                 | references | null: false, foreign_key:true   |
| parent_task_id       | references | foreign_key:{ to_table::tasks } |

### Association
- belongs_to :user
- has_many :subtasks, class_name: "Task", foreign_key: "parent_task_id"
- belongs_to :parent_task, class_name: "Task", optional: true
