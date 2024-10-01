Rails.application.routes.draw do
  root to: redirect('admin/login')
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :coaches, controllers: {
                       sessions: 'coaches/sessions'
                       }
  devise_for :employees, controllers: { sessions: 'employees/sessions' }


  namespace :api do
    namespace :v1 do
      resources :coaching_programs do
        resources :coach_assignments, only: [:create]
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :companies, only: [:show] do
        resources :employees, only: [:create]
      end
    end
  end

  resources :companies, only: [:show]


  resources :employees do
    get 'landing', on: :member
  end
  
  resources :coaches do
    get 'dashboard', on: :member
  end

  namespace :api do
    namespace :v1 do
      resources :employees, only:[:index, :create] do
        member do
          get :programs_with_coaches
        end
      end
    end
  end
  
  namespace :api do
    namespace :v1 do
      resources :employee_enrollments, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      post 'coaching_programs/:program_id/join', to: 'coaching_programs#join'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :coaches, only: [] do
        get 'dashboard', to: 'coach_dashboard#index'
      end
    end
  end

  
end
