Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :job_posts 
  #resources :applied_jobs
  # get 'job_posts/index'
  get '/search' , to: "job_posts#search"
  get '/show_applies/:id' , to: "job_posts#show_applies"
  get '/show_applies', to: "job_posts#show_applies"
  # get 'job_posts/new'
  # post 'job_posts/create'
  # get 'job_post/show'
  # get 'job_post/edit'
  # get 'job_post/update'
  # get 'job_post/destroy'
  # patch 'job_posts/update'
  get '/job_posts/:id/apply', to: "job_posts#apply", as: :apply

  # put '/job_posts/:id/apply', to: "job_posts#apply"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index" 
  get 'home/show'
  get 'home/search'

  resources :shortened_urls

  #post '/shortened_urls' , to: "shortened_urls#create"
end
 