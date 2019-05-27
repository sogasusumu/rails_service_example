# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :chat_rooms, dependent: :destroy
  has_many :clients, dependent: :destroy
end
