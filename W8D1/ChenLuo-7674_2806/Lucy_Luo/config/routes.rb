Rails.application.routes.draw do
  resources :users do
    resources :notes
  end
  resources :notes
  resource :session


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end