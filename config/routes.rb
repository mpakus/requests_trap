Rails.application.routes.draw do
  match ':trap_uri(.:format)', to: 'requests#create', via: [:post, :put, :get, :delete, :patch]
end
