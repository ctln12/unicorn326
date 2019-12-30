# frozen_string_literal: true

class DeviseCreateTutors < ActiveRecord::Migration[5.2]
  def change
    create_table :tutors do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.inet     :current_sign_in_ip
      # t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :subjects
      t.string :spoken_languages
      t.string :currency
      t.float :price
      t.string :country
      t.string :photo_url
      t.time :average_response_time
      t.date :validated_at

      t.timestamps null: false
    end

    add_index :tutors, :email,                unique: true
    add_index :tutors, :reset_password_token, unique: true
    # add_index :tutors, :confirmation_token,   unique: true
    # add_index :tutors, :unlock_token,         unique: true
  end
end
