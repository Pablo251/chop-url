Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sites
  get :top_trending_sites, to: 'sites#top_trending_sites'
  get 'go/(:url)', to: 'sites#go_to_url'
end
