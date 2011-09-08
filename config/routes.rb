Kanshabox::Application.routes.draw do
  root :to => 'homes#index'
  resources :thanks, :only => [:index, :new, :create, :destroy]
  devise_for :users
end
