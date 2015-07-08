Rails.application.routes.draw do
  match ':trap_uri', to: 'requests#create', via: [:post, :put, :get, :delete, :patch]
end
