class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def up
    change_table :users do |t|
      ## Database authenticatable
      # t.string :email,              null: false, default: ""
      # t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at

      ## Rememberable
      # t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
    end

    # add_index :users, :email,                unique: true
    # add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end

  def down
    change_table :users do |t|
      ## Database authenticatable
      # t.remove :email,              null: false, default: ""
      # t.remove :encrypted_password, null: false, default: ""

      ## Recoverable
      # t.remove :reset_password_token
      # t.remove :reset_password_sent_at

      ## Rememberable
      # t.remove :remember_created_at

      ## Trackable
      # t.remove :sign_in_count
      # t.remove :current_sign_in_at
      # t.remove :last_sign_in_at
      # t.remove :current_sign_in_ip
      # t.remove :last_sign_in_ip

      ## Confirmable
      # t.remove :confirmation_token
      # t.remove :confirmed_at
      # t.remove :confirmation_sent_at
      # t.remove :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.remove :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.remove :unlock_token # Only if unlock strategy is :email or :both
      # t.remove :locked_at
    end

    # remove_index :users, :email
    # remove_index :users, :reset_password_token
    # remove_index :users, :confirmation_token
    # remove_index :users, :unlock_token
  end
end
