module ApiRoutes
  def self.extended(router)
    router.instance_exec do
      devise_for :users, controllers: {
        sessions: 'api/v1/sessions'
      }
      namespace :api do
        api_version(module: 'V1', header: { name: 'X-API-VERSION', value: 'v1' }) do
          devise_scope :user do
            post 'auth/sign_up', to: 'registrations#create'
            post 'auth/sign_in', to: 'sessions#create'
          end

          resources :company, only: %i[index create update] do
            member do
              get :company_overview
              put :delete_company
            end
          end

          resources :review, only: %i[index create update] do
            member do
              put :delete_review
            end
          end
        end
      end
    end
  end
end