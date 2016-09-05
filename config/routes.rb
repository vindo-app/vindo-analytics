Rails.application.routes.draw do
    resources :pings, only: [:index, :show]

    resources :messages, only: [:index, :create]

    get "/ping" => "analytics#ping"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
