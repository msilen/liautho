Liautho::Application.routes.draw do
  root :to => "home#index"
  match 'auth/linkedin/callback', to: 'sessions#create'
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
