module ApiRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :api do
        api_version(module: 'V1', header: { name: 'X-API-VERSION', value: 'v1' }) do
          resources :company, only: %i[index create update] do
            member do
              get :company_overview
              put :delete_company
            end
          end

          resources :review, only: %i[index create update destroy] do
          end
        end
      end
    end
  end
end