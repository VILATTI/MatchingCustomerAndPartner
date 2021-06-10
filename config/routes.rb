Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :partners, only: [] do
        collection do
          post :match
        end
      end
    end
  end
end
