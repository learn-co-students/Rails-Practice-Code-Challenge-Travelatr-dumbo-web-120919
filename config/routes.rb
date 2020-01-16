Rails.application.routes.draw do
  resources :destinations
  resources :bloggers
  resources :posts
  
  post '/posts/:id' =>  'posts#add_like', as: 'like'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
