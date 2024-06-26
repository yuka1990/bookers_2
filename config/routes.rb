Rails.application.routes.draw do

  get 'users/show'
  get 'users/edit'
 root to: "homes#top"
 devise_for :users

 resources :books, only: [:new, :create,:index, :show,:destroy,:edit,:update]
 resources :users, only:[:show, :edit,:update,:index,:create]
get 'home/about' => 'homes#about', as: "about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
