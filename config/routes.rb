# frozen_string_literal: true

Rails.application.routes.draw do
  resources :companies, only: [] do
    resources :chat_rooms, only: %i[index] do
      resources :messages, only: %i[index create]
    end
  end
end
