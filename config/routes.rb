Rails.application.routes.draw do
  root 'used_urls#new'
  get '/used_urls', to: 'used_urls#index'
  get '/:short_name', to: 'used_urls#show'
  get '/used_urls/:short_name/edit', to: 'used_urls#edit'
  delete '/used_urls/:short_name', to: 'used_urls#destroy'
  patch '/used_urls/:short_name', to: 'used_urls#update'
  resources :used_urls
  resources :available_urls
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
