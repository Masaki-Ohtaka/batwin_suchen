Rails.application.routes.draw do
  scope :foundations do
    resources :job_change_dogs do
      resources :comments, only: :create
    end
  end
  devise_for :foundations, controllers:{
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
  # resources :foundations do
  #   resources :job_change_dogs
  # end

end
