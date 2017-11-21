Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :eventos

  get '/login', to: 'usuarios#login', as: 'login'
  post '/iniciar_sesion', to: 'usuarios#iniciar_sesion', as: 'iniciar_sesion'
  post '/logout', to: 'usuarios#logout', as: 'logout'
end
