Kanshabox::Application.routes.draw do
  root :to => 'homes#index'
  resources :thanks
  devise_for :users
end
