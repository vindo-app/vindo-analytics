Rails.application.routes.draw do
    resources :pings, only: [:index, :show]

    get "/ping" => "analytics#ping"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
