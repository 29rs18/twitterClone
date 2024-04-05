# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # If your users table already has an email column, you might not need to add or modify it here.
      # t.string :email,              null: false, default: ""
      unless column_exists?(:users, :encrypted_password)
        t.string :encrypted_password, null: false, default: ""
      end

      ## Recoverable
      unless column_exists?(:users, :reset_password_token)
        t.string   :reset_password_token
      end
      unless column_exists?(:users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      ## Rememberable
      unless column_exists?(:users, :remember_created_at)
        t.datetime :remember_created_at
      end

      ## Trackable
      # Uncomment the following lines if you wish to add these columns and they do not already exist in your table.
      # unless column_exists?(:users, :sign_in_count)
      #   t.integer  :sign_in_count, default: 0, null: false
      # end
      # unless column_exists?(:users, :current_sign_in_at)
      #   t.datetime :current_sign_in_at
      # end
      # unless column_exists?(:users, :last_sign_in_at)
      #   t.datetime :last_sign_in_at
      # end
      # unless column_exists?(:users, :current_sign_in_ip)
      #   t.string   :current_sign_in_ip
      # end
      # unless column_exists?(:users, :last_sign_in_ip)
      #   t.string   :last_sign_in_ip
      # end

      ## Confirmable
      # Uncomment below if you wish to add these fields and they do not already exist.
      # unless column_exists?(:users, :confirmation_token)
      #   t.string   :confirmation_token
      # end
      # unless column_exists?(:users, :confirmed_at)
      #   t.datetime :confirmed_at
      # end
      # unless column_exists?(:users, :confirmation_sent_at)
      #   t.datetime :confirmation_sent_at
      # end
      # unless column_exists?(:users, :unconfirmed_email)
      #   t.string   :unconfirmed_email # Only if using reconfirmable
      # end

      ## Lockable
      # Uncomment below if you wish to add these fields and they do not already exist.
      # unless column_exists?(:users, :failed_attempts)
      #   t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # end
      # unless column_exists?(:users, :unlock_token)
      #   t.string   :unlock_token # Only if unlock strategy is :email or :both
      # end
      # unless column_exists?(:users, :locked_at)
      #   t.datetime :locked_at
      # end

      # Uncomment below if timestamps were not included in your original model.
      # unless column_exists?(:users, :created_at) && column_exists?(:users, :updated_at)
      #   t.timestamps null: false
      # end
    end

    add_index :users, :email,                unique: true unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    # add_index :users, :confirmation_token,   unique: true unless index_exists?(:users, :confirmation_token)
    # add_index :users, :unlock_token,         unique: true unless index_exists?(:users, :unlock_token)
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
