Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :job_posts 
  # get 'job_posts/index'
  # get 'job_posts/search'
  # get 'job_posts/new'
  # post 'job_posts/create'
  # get 'job_post/show'
  # get 'job_post/edit'
  # get 'job_post/update'
  # get 'job_post/destroy'
  # patch 'job_posts/update'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index" 
  get 'home/show'
  get 'home/search'
end
