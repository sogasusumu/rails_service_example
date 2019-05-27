# frozen_string_literal: true

class CreateUserMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_messages do |t|
      t.references :chat_room, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
