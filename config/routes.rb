Rails.application.routes.draw do
  get 'job_change_dogs/index'
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
  root to: "job_change_dogs#index"
  
end
