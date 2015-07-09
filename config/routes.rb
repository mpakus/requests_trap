Rails.application.routes.draw do
  match ':trap_uri(.:format)', to: 'requests#create', via: [:post, :put, :get, :delete, :patch]
  scope ':trap_uri' do
    resources :requests, only: [:index, :show] do
      get :stream, on: :member
    end
  end
end
