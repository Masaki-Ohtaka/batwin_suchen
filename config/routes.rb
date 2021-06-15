Rails.application.routes.draw do
  devise_for :foundations, controllers: {
    sessions:      'foundations/sessions',
    passwords:     'foundations/passwords',
    registrations: 'foundations/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords', 
    registrations: 'users/registrations'
  }
  root to: "prototypes#index"
  
end
