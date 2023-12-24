Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: redirect('/health')
  get 'health', to: 'health#show'

  extend ApiRoutes unless ENV['ATTACHED_API'].to_i.zero?
end
