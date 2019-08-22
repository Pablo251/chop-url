Rails.application.routes.draw do
  resources :sites
  get :top_trending_sites, to: 'sites#top_trending_sites'
  get 'go/(:url)', to: 'sites#go_to_url'
end
