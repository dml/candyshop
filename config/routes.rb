CandyShop::Application.routes.draw do
  resources :participations

  root :to => "welcome#index"
end
