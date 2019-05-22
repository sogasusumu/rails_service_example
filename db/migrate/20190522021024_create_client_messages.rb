class CreateClientMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :client_messages do |t|
      t.references :chat_room, foreign_key: true
      t.references :client, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
