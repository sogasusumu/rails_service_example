# frozen_string_literal: true

class User < ApplicationRecord
  has_many :chat_rooms, dependent: :destroy

  validates :first_name,
            presence: true

  validates :last_name,
            presence: true

  validates :email,
            presence: true,
            uniqueness: true
end
