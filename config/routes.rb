Rails.application.routes.draw do
  resources :company_messages, only: %i[index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
