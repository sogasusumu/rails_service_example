# frozen_string_literal: true

class UserMessage < ApplicationRecord
  belongs_to :chat_room
end
