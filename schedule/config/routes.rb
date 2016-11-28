Rails.application.routes.draw do
  root 'home#index'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    # ...
  }

  get 'groups_by_institution/:id', to: 'users/registrations#get_groups', as: :groups_by_institution

  devise_scope :admin do
    unauthenticated do
      namespace :admin_section do
        match '(*any)' , to: redirect('/'), via: %i(get post)
      end
    end

    authenticated :admin do
      namespace :admin_section do
        root 'admin_section#index'
        resources :lessons
        resources :subjects
        resources :institutions
        resources :groups
        resources :users, only: [:index]
        patch 'change_user_role', to: 'users#change_role', as: :change_user_role
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :instructions, only: [:index]
      resources :groups, only: [:index]
      resources :institutions, only: [:index]
      resources :lessons, only: [:index]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
