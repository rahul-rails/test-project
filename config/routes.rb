Rails.application.routes.draw do
  
  resources :plays
  root to: "image_uploads#new"
  resource :image_uploads, only: [:new, :create, :show]
  get '/image_uploads/random_image_urls', :to => 'image_uploads#random_image_urls'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
