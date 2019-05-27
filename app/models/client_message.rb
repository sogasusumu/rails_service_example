# frozen_string_literal: true

class ClientMessage < ApplicationRecord
  belongs_to :chat_room
end
