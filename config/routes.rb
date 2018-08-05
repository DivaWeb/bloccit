Rails.application.routes.draw do
   resources :questions
   resources :posts
   resources :welcome

   get 'about' => 'welcome#about'

   resources :sessions, only: [:new, :create, :destroy]
   resources :users, only: [:new, :create, :show]




  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
