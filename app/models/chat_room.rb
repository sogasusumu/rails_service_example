class ChatRoom < ApplicationRecord
  belongs_to :company
  belongs_to :user

  has_many :client_messages, dependent: :destroy
  has_many :user_messages, dependent: :destroy
end
