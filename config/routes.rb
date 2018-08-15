Rails.application.routes.draw do
   resources :questions
   resources :welcome
   resources :topics do

   resources :posts, except: [:index]
 end

 resources :posts, only: [] do
   resources :comments, only: [:create, :destroy]
   post '/up-vote' => 'votes#up_vote', as: :up_vote
   post '/down-vote' => 'votes#down_vote', as: :down_vote
 end


   get 'about' => 'welcome#about'

   resources :sessions, only: [:new, :create, :destroy]
   resources :users, only: [:new, :create, :show]
   resources :users, only: [:new, :create]
   post 'users/confirm' => 'users#confirm'
   resources :sessions, only: [:new, :create, :destroy]




  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
