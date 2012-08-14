Kaavi::Application.routes.draw do
  resources :significados

  resources :palabras do
    resources :variantes, only: [:index, :new, :create]
  end

  root :to => 'palabras#index'
end
